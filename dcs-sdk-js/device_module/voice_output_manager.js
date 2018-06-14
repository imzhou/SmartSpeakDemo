/*
 * Copyright (c) 2017 Baidu, Inc. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const path = require("path");
const ROOT_PATH = path.resolve(__dirname + "/..");

const BaseManager = require("./base_manager");
const util = require('util');
const DataStreamPlayer = require("./system_impl/data_stream_player");
const DcsProtocol = require(ROOT_PATH + "/dcs_protocol");
class VoiceOutputManager extends BaseManager {
    constructor(controller) {
        super();
        this.content_cache=[];
        this.waiting_content_id=null;
        this.NAMESPACE = "ai.dueros.device_interface.voice_output";
        this.ttsplayer = new DataStreamPlayer();

        this.ttsplayer.on("start", () => {
            //改了下逻辑：开始执行speak指令的时候，才算是tts 正在播放
            /*
            controller.emit("event", DcsProtocol.createEvent(this.NAMESPACE, "SpeechStarted", controller.getContext(), {
                token: this.last_played_token
            }));
            this.emit("start");
            */
        });
        this.ttsplayer.on("end", () => {
            controller.emit("event", DcsProtocol.createEvent(this.NAMESPACE, "SpeechFinished", controller.getContext(), {
                token: this.last_played_token
            }));
            this.emit("end");
        });
        controller.on("content", (content_id, content) => {
            //console.log("on controller content",this.waiting_content_id,content_id);
            if (this.waiting_content_id == content_id) {
                this.ttsplayer.play(content);
                this.content_cache = this.content_cache.reduce((results,item)=>{
                    if(item[0] != content_id){
                        results.push(item);
                    }
                    return results;
                },[]);
                this.waiting_content_id = null;
            } else {
                this.content_cache.push( [content_id, content]);
                setTimeout(() => {
                    this.content_cache = this.content_cache.reduce((results,item)=>{
                        if(item[0] == content_id){
                            console.error("content timeout, no speak directive");
                        }else{
                            results.push(item);
                        }
                        return results;
                    },[]);
                }, 2000);
            }
        });

    }

    SpeakDirective(directive, controller) {
        this.last_played_token = directive.payload.token;
        var url = directive.payload.url;
        if (!url) {
            console.log("[ERROR] " + JSON.stringify(directive));
            return;
            //throw new Error("no tts return");
        }
        var matches, cid;
        if (matches = url.match(/^cid:(.*)/)) {
            cid = matches[1];
        } else {
            return;
        }

        //改了下逻辑：开始执行speak指令的时候，才算是tts 正在播放
        controller.emit("event", DcsProtocol.createEvent(this.NAMESPACE, "SpeechStarted", controller.getContext(), {
            token: this.last_played_token
        }));
        this.emit("start");

        return new Promise((resolve, reject) => {
            let result=null;
            this.content_cache = this.content_cache.reduce((results,item)=>{
                if(item[0] == cid){
                    result=item;
                }else{
                    results.push(item);
                }
                return results;
            },[]);

            if (result && result[0] == cid) {
                this.ttsplayer.play(result[1]);
                this.waiting_content_id = null;
            } else {
                this.waiting_content_id = cid;
            }

            this.once("end",()=>{
                console.log("resolve speak promise");
                resolve();
            });
            setTimeout(()=>{
                reject();
            },50000);
        });
    }
    getContext() {
        return {
            "header": {
                "namespace": this.NAMESPACE,
                "name": "SpeechState"
            },
            "payload": {
                "token": this.last_played_token,
                ///TODO get how long was played, in sox.play.stderr?
                "offsetInMilliseconds": 0,
                "playerActivity": this.ttsplayer.isPlaying() ? "PLAYING" : "IDLE"
            }
        };
    }
    isPlaying() {
        if (this.waiting_content_id) {
            return true;
        }
        return this.ttsplayer.isPlaying();
    }
    stop() {
        return this.ttsplayer.stop();
    }
}

module.exports = VoiceOutputManager;
