import * as visitors from './visitors';
import * as validators from './validators';
import { Model } from '../types';
export interface Options {
    auth?: unknown;
}
export interface ValidateFunc {
    (data: unknown, schema: Model, options?: Options): Promise<void>;
}
declare const _default: {
    contentAPI: {
        input: ValidateFunc;
        query: (query: Record<string, unknown>, schema: Model, { auth }?: Options) => Promise<void>;
        filters: ValidateFunc;
        sort: ValidateFunc;
        fields: ValidateFunc;
    };
    validators: typeof validators;
    visitors: typeof visitors;
};
export default _default;
//# sourceMappingURL=index.d.ts.map