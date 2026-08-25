import * as $protobuf from "@ohos/protobufjs";
import * as $lark from "@lark/ohos_pb";
import * as $GetUserNameResponse from "./GetUserNameResponse+codec";
export interface IGetUserNameResponse {
    name?: string;
}
export class GetUserNameResponse implements IGetUserNameResponse {
    public _name?: string;
    public get name(): string {
        return this._name ?? "";
    }
    public set name(v: string | undefined) {
        this._name = v;
    }
    public static $meta: $lark.Meta<IGetUserNameResponse, GetUserNameResponse> = {
        decoder: new $GetUserNameResponse.$Decoder,
        encoder: new $GetUserNameResponse.$Encoder,
        creator: new $GetUserNameResponse.$Creator
    };
    private constructor(obj?: IGetUserNameResponse){
        this._name = obj?.name;
    }
    public static create(obj?: GetUserNameResponse | IGetUserNameResponse): GetUserNameResponse {
        if (obj instanceof GetUserNameResponse) {
            return obj;
        } else {
            return new GetUserNameResponse(obj);
        }
    }
    public static decode(data: Uint8Array | $protobuf.Reader, l?: number): GetUserNameResponse {
        return new GetUserNameResponse(GetUserNameResponse.$meta.decoder.decode(data, l));
    }
    public static encode(req: GetUserNameResponse, w?: $protobuf.Writer): $protobuf.Writer {
        return GetUserNameResponse.$meta.encoder.encode(req, w);
    }
}
