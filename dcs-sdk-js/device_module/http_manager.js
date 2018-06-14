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
const request = require('request');
const DcsProtocol = require(ROOT_PATH + "/dcs_protocol");
class HttpManager extends BaseManager {
    constructor() {
        super();
        this.NAMESPACE = "ai.dueros.device_interface.http";
    }

    DoHttpRequestDirective(directive, controller) {
        let params = {};
        let token = directive.payload.token;
        params.url = directive.payload.url;
        if (directive.payload.headers) {
            params.headers = directive.payload.headers;
        }
        if (directive.payload.body && directive.payload.body.data) {
            //TODO
            params.body = directive.payload.body.data;
        }
        if (directive.payload.method) {
            params.method = directive.payload.method.toLocaleLowerCase();
        }
        request(params, function(error, response, body) {
            if (error) {
                controller.emit("event", DcsProtocol.createEvent("ai.dueros.device_interface.http", "HttpRequestFailed", controller.getContext(), {
                    token: token,
                    reason: "OTHER",
                    messageId: "" + error,
                }));
                return;
            }

            controller.emit("event", DcsProtocol.createEvent("ai.dueros.device_interface.http", "HttpRequestSucceeded", controller.getContext(), {
                token: token,
                code: "" + response.statusCode,
                headers: response.headers,
                body: {
                    dataType: "TEXT",
                    data: body
                }
            }));
        });
    }
}

module.exports = HttpManager;