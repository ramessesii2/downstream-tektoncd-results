curl -s http://localhost:8443/apis/results.tekton.dev/v1alpha2/parents/default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/records/dc86e2bf-9d1a-3f41-b08e-00e3a79206ad | jq
# {
#   "name": "default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/records/dc86e2bf-9d1a-3f41-b08e-00e3a79206ad",
#   "id": "d8709582-53b9-4f96-ac16-3dab372ed1be",
#   "uid": "d8709582-53b9-4f96-ac16-3dab372ed1be",
#   "data": {
#     "type": "results.tekton.dev/v1alpha2.Log",
#     "value": "eyJraW5kIjogIkxvZyIsICJzcGVjIjogeyJ0eXBlIjogIkZpbGUiLCAicmVzb3VyY2UiOiB7InVpZCI6ICI2ZTYzY2JkOS1mMGYwLTQ3NjktODgyNi02NDJjNTMwMjVlMWQiLCAia2luZCI6ICJQaXBlbGluZVJ1biIsICJuYW1lIjogImhlbGxvLXE3ajRtIiwgIm5hbWVzcGFjZSI6ICJkZWZhdWx0In19LCAic3RhdHVzIjogeyJwYXRoIjogImRlZmF1bHQvZGM4NmUyYmYtOWQxYS0zZjQxLWIwOGUtMDBlM2E3OTIwNmFkL2hlbGxvLXE3ajRtLWxvZyIsICJzaXplIjogMTg2fSwgIm1ldGFkYXRhIjogeyJ1aWQiOiAiZGM4NmUyYmYtOWQxYS0zZjQxLWIwOGUtMDBlM2E3OTIwNmFkIiwgIm5hbWUiOiAiaGVsbG8tcTdqNG0tbG9nIiwgIm5hbWVzcGFjZSI6ICJkZWZhdWx0IiwgImNyZWF0aW9uVGltZXN0YW1wIjogbnVsbH0sICJhcGlWZXJzaW9uIjogInJlc3VsdHMudGVrdG9uLmRldi92MWFscGhhMiJ9"
#   },
#   "etag": "d8709582-53b9-4f96-ac16-3dab372ed1be-1692382625656460424",
#   "createdTime": "2023-08-18T18:17:05.614545Z",
#   "createTime": "2023-08-18T18:17:05.614545Z",
#   "updatedTime": "2023-08-18T18:17:05.656460Z",
#   "updateTime": "2023-08-18T18:17:05.656460Z"
# }

curl -s http://localhost:8443/apis/results.tekton.dev/v1alpha2/parents/default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs/dc86e2bf-9d1a-3f41-b08e-00e3a79206ad | jq -r .result.data | base64 -d
# [hello : prepare] 2023/08/18 18:16:04 Entrypoint initialization

# [hello : place-scripts] 2023/08/18 18:16:05 Decoded script /tekton/scripts/script-0-zkwdl

# [hello : hello] hello world!

curl -s http://localhost:8443/apis/results.tekton.dev/v1alpha2/parents/default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs/4753540e-e031-3539-9e33-092669d0330a| jq -r .result.data | base64 -d
# [prepare] 2023/08/18 18:16:04 Entrypoint initialization

# [place-scripts] 2023/08/18 18:16:05 Decoded script /tekton/scripts/script-0-zkwdl

# [hello] hello world!

curl -s http://localhost:8443/apis/results.tekton.dev/v1alpha2/parents/default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs/dc86e2bf-9d1a-3f41-b08e-00e3a79206ad | jq -r .result.data | base64 -d
# [hello : prepare] 2023/08/18 18:16:04 Entrypoint initialization

# [hello : place-scripts] 2023/08/18 18:16:05 Decoded script /tekton/scripts/script-0-zkwdl

# [hello : hello] hello world!

curl -s http://localhost:8443/apis/results.tekton.dev/v1alpha2/parents/default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs | jq
# {
#   "records": [
#     {
#       "name": "default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs/4753540e-e031-3539-9e33-092669d0330a",
#       "id": "7d331699-8579-44a4-a765-73563d3f1ebd",
#       "uid": "7d331699-8579-44a4-a765-73563d3f1ebd",
#       "data": {
#         "type": "results.tekton.dev/v1alpha2.Log",
#         "value": "eyJraW5kIjogIkxvZyIsICJzcGVjIjogeyJ0eXBlIjogIkZpbGUiLCAicmVzb3VyY2UiOiB7InVpZCI6ICI5ZWI5YzJlNy1iNWU2LTRlOGItODY2Mi01OWY0OTA3YjEwNzYiLCAia2luZCI6ICJUYXNrUnVuIiwgIm5hbWUiOiAiaGVsbG8tcTdqNG0taGVsbG8iLCAibmFtZXNwYWNlIjogImRlZmF1bHQifX0sICJzdGF0dXMiOiB7InBhdGgiOiAiZGVmYXVsdC80NzUzNTQwZS1lMDMxLTM1MzktOWUzMy0wOTI2NjlkMDMzMGEvaGVsbG8tcTdqNG0taGVsbG8tbG9nIiwgInNpemUiOiAxNzN9LCAibWV0YWRhdGEiOiB7InVpZCI6ICI0NzUzNTQwZS1lMDMxLTM1MzktOWUzMy0wOTI2NjlkMDMzMGEiLCAibmFtZSI6ICJoZWxsby1xN2o0bS1oZWxsby1sb2ciLCAibmFtZXNwYWNlIjogImRlZmF1bHQiLCAiY3JlYXRpb25UaW1lc3RhbXAiOiBudWxsfSwgImFwaVZlcnNpb24iOiAicmVzdWx0cy50ZWt0b24uZGV2L3YxYWxwaGEyIn0="
#       },
#       "etag": "7d331699-8579-44a4-a765-73563d3f1ebd-1692382755533525513",
#       "createdTime": "2023-08-18T18:19:15.465585Z",
#       "createTime": "2023-08-18T18:19:15.465585Z",
#       "updatedTime": "2023-08-18T18:19:15.533525Z",
#       "updateTime": "2023-08-18T18:19:15.533525Z"
#     },
#     {
#       "name": "default/results/6e63cbd9-f0f0-4769-8826-642c53025e1d/logs/dc86e2bf-9d1a-3f41-b08e-00e3a79206ad",
#       "id": "d8709582-53b9-4f96-ac16-3dab372ed1be",
#       "uid": "d8709582-53b9-4f96-ac16-3dab372ed1be",
#       "data": {
#         "type": "results.tekton.dev/v1alpha2.Log",
#         "value": "eyJraW5kIjogIkxvZyIsICJzcGVjIjogeyJ0eXBlIjogIkZpbGUiLCAicmVzb3VyY2UiOiB7InVpZCI6ICI2ZTYzY2JkOS1mMGYwLTQ3NjktODgyNi02NDJjNTMwMjVlMWQiLCAia2luZCI6ICJQaXBlbGluZVJ1biIsICJuYW1lIjogImhlbGxvLXE3ajRtIiwgIm5hbWVzcGFjZSI6ICJkZWZhdWx0In19LCAic3RhdHVzIjogeyJwYXRoIjogImRlZmF1bHQvZGM4NmUyYmYtOWQxYS0zZjQxLWIwOGUtMDBlM2E3OTIwNmFkL2hlbGxvLXE3ajRtLWxvZyIsICJzaXplIjogMTg2fSwgIm1ldGFkYXRhIjogeyJ1aWQiOiAiZGM4NmUyYmYtOWQxYS0zZjQxLWIwOGUtMDBlM2E3OTIwNmFkIiwgIm5hbWUiOiAiaGVsbG8tcTdqNG0tbG9nIiwgIm5hbWVzcGFjZSI6ICJkZWZhdWx0IiwgImNyZWF0aW9uVGltZXN0YW1wIjogbnVsbH0sICJhcGlWZXJzaW9uIjogInJlc3VsdHMudGVrdG9uLmRldi92MWFscGhhMiJ9"
#       },
#       "etag": "d8709582-53b9-4f96-ac16-3dab372ed1be-1692382625656460424",
#       "createdTime": "2023-08-18T18:17:05.614545Z",
#       "createTime": "2023-08-18T18:17:05.614545Z",
#       "updatedTime": "2023-08-18T18:17:05.656460Z",
#       "updateTime": "2023-08-18T18:17:05.656460Z"
#     }
#   ],
#   "nextPageToken": ""
# }