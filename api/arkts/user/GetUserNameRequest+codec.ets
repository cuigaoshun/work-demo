import Long from "long";
import * as $lark from "@lark/ohos_pb";
import * as user_http from "./../user_http";
import { Writer, Reader } from "@ohos/protobufjs";
import { GetUserNameRequest, IGetUserNameRequest } from "./GetUserNameRequest";
@Sendable
export class $Decoder implements $lark.Decoder<user_http.user.GetUserNameRequest> {
    public decode($data: Uint8Array | Reader, $l?: number): user_http.user.GetUserNameRequest {
        const $r = $data instanceof Reader ? $data : Reader.create($data);
        let userId: Long | undefined;
        const $c = $l === undefined ? $r.len : $r.pos + $l;
        while($r.pos < $c){
            let t = $r.uint32();
            switch(t >>> 3){
                case 1:
                    (userId) = Long.fromValue($r.int64());
                    break;
                default:
                    $r.skipType(t & 7);
                    break;
            }
        }
        return {
            userId: userId
        };
    }
}
@Sendable
export class $Encoder implements $lark.Encoder<user_http.user.GetUserNameRequest> {
    public encode($req: user_http.user.GetUserNameRequest, $w?: Writer): Writer {
        const $writer = $w ?? Writer.create();
        if ($req._userId !== undefined) {
            $writer.uint32(8).int64($req._userId);
        }
        return $writer;
    }
}
export class $Creator implements $lark.Creator<user_http.user.GetUserNameRequest, user_http.user.GetUserNameRequest> {
    public create(obj?: user_http.user.GetUserNameRequest): user_http.user.GetUserNameRequest {
        return user_http.user.GetUserNameRequest.create(obj);
    }
}
