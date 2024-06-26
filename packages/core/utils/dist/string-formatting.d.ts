import slugify from '@sindresorhus/slugify';
declare const nameToSlug: (name: string, options?: slugify.Options) => string;
declare const nameToCollectionName: (name: string) => string;
declare const toRegressedEnumValue: (value: string) => string;
declare const getCommonBeginning: (...strings: string[]) => string;
declare const getCommonPath: (...paths: string[]) => string;
declare const escapeQuery: (query: string, charsToEscape: string, escapeChar?: string) => string;
declare const stringIncludes: (arr: unknown[], val: unknown) => boolean;
declare const stringEquals: (a: unknown, b: unknown) => boolean;
declare const isCamelCase: (value: string) => boolean;
declare const isKebabCase: (value: string) => boolean;
declare const startsWithANumber: (value: string) => boolean;
declare const joinBy: (joint: string, ...args: string[]) => string;
declare const toKebabCase: (value: string) => string;
export { nameToSlug, nameToCollectionName, getCommonBeginning, getCommonPath, escapeQuery, stringIncludes, stringEquals, isCamelCase, isKebabCase, toKebabCase, toRegressedEnumValue, startsWithANumber, joinBy, };
//# sourceMappingURL=string-formatting.d.ts.map