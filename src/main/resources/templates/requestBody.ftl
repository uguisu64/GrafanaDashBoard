{
  "dashboard": {
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": {
            "type": "grafana",
            "uid": "-- Grafana --"
          },
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "target": {
            "limit": 100,
            "matchAny": false,
            "tags": [],
            "type": "dashboard"
          },
          "type": "dashboard"
        }
      ]
    },
    "editable": true,
    "fiscalYearStartMonth": 0,
    "graphTooltip": 0,
    "id": 1,
    "links": [],
    "liveNow": false,
    "panels": [
  <#list groupDatas as groupData>
      {
        "datasource": {
          "type": "influxdb",
          "uid": "KSFreigVk"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 8,
          "w": 12,
          "x": 0,
          "y": ${groupData_index * 8}
        },
        "id": 6,
        "options": {
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true
        },
        "pluginVersion": "9.0.2",
        "targets": [
          {
            "datasource": {
              "type": "influxdb",
              "uid": "KSFreigVk"
            },
            "query": "from(bucket: \"GitLabData\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"gitLabData\")\r\n  |> filter(fn: (r) => <#list groupData.userList as userId><#if userId_index == 0>r[\"userId\"] == \"${userId}\"<#else> or r[\"userId\"] == \"${userId}\"</#if></#list>)\r\n  |> drop(columns: [\"jobId\", \"projectId\", \"userId\"])\r\n  |> sum()",
            "refId": "A"
          }
        ],
        "title": "${groupData.name} Sum",
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "influxdb",
          "uid": "KSFreigVk"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "continuous-GrYlRd"
            },
            "custom": {
              "axisGridShow": true,
              "axisLabel": "JobTime",
              "axisPlacement": "left",
              "axisSoftMin": 0,
              "fillOpacity": 80,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineWidth": 2,
              "scaleDistribution": {
                "type": "linear"
              }
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 8,
          "w": 12,
          "x": 12,
          "y": ${groupData_index * 8}
        },
        "id": 4,
        "options": {
          "barRadius": 0,
          "barWidth": 0.85,
          "colorByField": "jobTime",
          "groupWidth": 0.7,
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "right"
          },
          "orientation": "auto",
          "showValue": "auto",
          "stacking": "none",
          "tooltip": {
            "mode": "single",
            "sort": "none"
          },
          "xField": "Time",
          "xTickLabelRotation": 0,
          "xTickLabelSpacing": 100
        },
        "pluginVersion": "9.0.2",
        "targets": [
          {
            "datasource": {
              "type": "influxdb",
              "uid": "KSFreigVk"
            },
            "query": "from(bucket: \"GitLabData\")\r\n  |> range(start: v.timeRangeStart, stop:v.timeRangeStop)\r\n  |> filter(fn: (r) => r._measurement == \"gitLabData\")\r\n  |> filter(fn: (r) => r._field == \"jobTime\")\r\n  |> filter(fn: (r) => <#list groupData.userList as userId><#if userId_index == 0>r[\"userId\"] == \"${userId}\"<#else> or r[\"userId\"] == \"${userId}\"</#if></#list>)\r\n  |> drop(columns: [\"jobId\", \"projectId\", \"userId\"])",
            "refId": "A"
          }
        ],
        "title": "${groupData.name}",
        "type": "barchart"
      }<#if groupData_has_next>,</#if>
  </#list>
    ],
    "refresh": false,
    "schemaVersion": 36,
    "style": "dark",
    "tags": [],
    "templating": {
      "list": []
    },
    "time": {
      "from": "now-90d",
      "to": "now"
    },
    "timepicker": {},
    "timezone": "",
    "title": "test",
    "uid": "PwHjvZR4z",
    "version": 7,
    "weekStart": ""
  },
  "overwrite": true
}