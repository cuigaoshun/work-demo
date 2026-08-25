import * as $lark from "@lark/ohos_pb";
import * as user_http from "./../user_http";
import { Reader, Writer } from "@ohos/protobufjs";
import { GetUserNameResponse, IGetUserNameResponse } from "./GetUserNameResponse";
@Sendable
export class $Decoder implements $lark.Decoder<user_http.user.GetUserNameResponse> {
    public decode($data: Uint8Array | Reader, $l?: number): user_http.user.GetUserNameResponse {
        const $r = $data instanceof Reader ? $data : Reader.create($data);
        let name: string | undefined;
        const $c = $l === undefined ? $r.len : $r.pos + $l;
        while($r.pos < $c){
            let t = $r.uint32();
            switch(t >>> 3){
                case 1:
                    (name) = $r.string();
                    break;
                default:
                    $r.skipType(t & 7);
                    break;
            }
        }
        return {
            name: name
        };
    }
}
@Sendable
export class $Encoder implements $lark.Encoder<user_http.user.GetUserNameResponse> {
    public encode($req: user_http.user.GetUserNameResponse, $w?: Writer): Writer {
        const $writer = $w ?? Writer.create();
        if ($req._name !== undefined) {
            $writer.uint32(10).string($req._name);
        }
        return $writer;
    }
}
export class $Creator implements $lark.Creator<user_http.user.GetUserNameResponse, user_http.user.GetUserNameResponse> {
    public create(obj?: user_http.user.GetUserNameResponse): user_http.user.GetUserNameResponse {
        return user_http.user.GetUserNameResponse.create(obj);
    }
}
