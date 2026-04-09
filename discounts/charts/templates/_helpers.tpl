{{ define "labels" }}
app: {{ .Values.appName | default "discounts" }}
{{ end }}

{{ define "selectorLabels" }}
app: {{ .Values.appName | default "discounts" }}
{{ end }}

{{ define "fullname" }}
{{- if .Values.fullnameOverride -}}
  {{ .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
  {{ .Values.nameOverride | default .Chart.Name }}-{{ .Values.appName | default "discounts" }}
{{- end -}}
{{ end }}

{{ define "name" }}
{{- if .Values.nameOverride -}}
  {{ .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
  {{ .Chart.Name }}
{{- end -}}
{{ end }}