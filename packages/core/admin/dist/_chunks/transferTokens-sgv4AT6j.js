"use strict";
const index = require("./index-EngJvLPK.js");
const transferTokenService = index.adminApi.injectEndpoints({
  endpoints: (builder) => ({
    getTransferTokens: builder.query({
      query: () => ({
        url: "/admin/transfer/tokens",
        method: "GET"
      }),
      transformResponse: (response) => response.data,
      providesTags: (res, _err) => [
        ...res?.map(({ id }) => ({ type: "TransferToken", id })) ?? [],
        { type: "TransferToken", id: "LIST" }
      ]
    }),
    getTransferToken: builder.query({
      query: (id) => `/admin/transfer/tokens/${id}`,
      transformResponse: (response) => response.data,
      providesTags: (res, _err, id) => [{ type: "TransferToken", id }]
    }),
    createTransferToken: builder.mutation({
      query: (body) => ({
        url: "/admin/transfer/tokens",
        method: "POST",
        data: body
      }),
      transformResponse: (response) => response.data,
      invalidatesTags: [{ type: "TransferToken", id: "LIST" }]
    }),
    deleteTransferToken: builder.mutation({
      query: (id) => ({
        url: `/admin/transfer/tokens/${id}`,
        method: "DELETE"
      }),
      transformResponse: (response) => response.data,
      invalidatesTags: (_res, _err, id) => [{ type: "TransferToken", id }]
    }),
    updateTransferToken: builder.mutation({
      query: ({ id, ...body }) => ({
        url: `/admin/transfer/tokens/${id}`,
        method: "PUT",
        data: body
      }),
      transformResponse: (response) => response.data,
      invalidatesTags: (_res, _err, { id }) => [{ type: "TransferToken", id }]
    })
  }),
  overrideExisting: false
});
const {
  useGetTransferTokensQuery,
  useGetTransferTokenQuery,
  useCreateTransferTokenMutation,
  useDeleteTransferTokenMutation,
  useUpdateTransferTokenMutation
} = transferTokenService;
exports.useCreateTransferTokenMutation = useCreateTransferTokenMutation;
exports.useDeleteTransferTokenMutation = useDeleteTransferTokenMutation;
exports.useGetTransferTokenQuery = useGetTransferTokenQuery;
exports.useGetTransferTokensQuery = useGetTransferTokensQuery;
exports.useUpdateTransferTokenMutation = useUpdateTransferTokenMutation;
//# sourceMappingURL=transferTokens-sgv4AT6j.js.map