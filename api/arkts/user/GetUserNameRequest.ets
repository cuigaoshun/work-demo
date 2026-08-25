import Long from "long";
import * as $protobuf from "@ohos/protobufjs";
import * as $lark from "@lark/ohos_pb";
import * as $GetUserNameRequest from "./GetUserNameRequest+codec";
export interface IGetUserNameRequest {
    userId?: Long;
}
export class GetUserNameRequest implements IGetUserNameRequest {
    public _userId?: Long;
    public get userId(): Long {
        return this._userId ?? Long.ZERO;
    }
    public set userId(v: Long | undefined) {
        this._userId = v;
    }
    public static $meta: $lark.Meta<IGetUserNameRequest, GetUserNameRequest> = {
        decoder: new $GetUserNameRequest.$Decoder,
        encoder: new $GetUserNameRequest.$Encoder,
        creator: new $GetUserNameRequest.$Creator
    };
    private constructor(obj?: IGetUserNameRequest){
        this._userId = obj?.userId != undefined ? Long.fromValue(obj?.userId) : undefined;
    }
    public static create(obj?: GetUserNameRequest | IGetUserNameRequest): GetUserNameRequest {
        if (obj instanceof GetUserNameRequest) {
            return obj;
        } else {
            return new GetUserNameRequest(obj);
        }
    }
    public static decode(data: Uint8Array | $protobuf.Reader, l?: number): GetUserNameRequest {
        return new GetUserNameRequest(GetUserNameRequest.$meta.decoder.decode(data, l));
    }
    public static encode(req: GetUserNameRequest, w?: $protobuf.Writer): $protobuf.Writer {
        return GetUserNameRequest.$meta.encoder.encode(req, w);
    }
}
