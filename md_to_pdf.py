import markdown
from weasyprint import HTML, CSS
import os

# 读取 Markdown 文件
md_file = r'C:\Users\Administrator\.openclaw\workspace\skills\foxclaw-aios\SKILL.md'
output_pdf = r'C:\Users\Administrator\.openclaw\workspace\FoxClaw-AIOS-说明书.pdf'

with open(md_file, 'r', encoding='utf-8') as f:
    md_content = f.read()

# 将 Markdown 转换为 HTML
html_content = markdown.markdown(md_content, extensions=['tables', 'fenced_code', 'toc'])

# 添加样式
html_full = f'''<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoxClaw AIOS 说明书</title>
    <style>
        @page {{
            size: A4;
            margin: 2cm;
        }}
        body {{
            font-family: "Microsoft YaHei", "SimHei", "Noto Sans CJK SC", sans-serif;
            font-size: 11pt;
            line-height: 1.6;
            color: #333;
        }}
        h1 {{
            color: #1a5276;
            font-size: 24pt;
            border-bottom: 3px solid #1a5276;
            padding-bottom: 10px;
        }}
        h2 {{
            color: #2874a6;
            font-size: 18pt;
            margin-top: 25px;
            border-left: 4px solid #2874a6;
            padding-left: 10px;
        }}
        h3 {{
            color: #3498db;
            font-size: 14pt;
            margin-top: 20px;
        }}
        code {{
            background-color: #f4f4f4;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: Consolas, monospace;
            font-size: 10pt;
        }}
        pre {{
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
            border-left: 3px solid #3498db;
        }}
        pre code {{
            background-color: transparent;
            padding: 0;
        }}
        table {{
            border-collapse: collapse;
            width: 100%;
            margin: 15px 0;
        }}
        th, td {{
            border: 1px solid #ddd;
            padding: 8px 12px;
            text-align: left;
        }}
        th {{
            background-color: #2874a6;
            color: white;
        }}
        tr:nth-child(even) {{
            background-color: #f2f2f2;
        }}
        blockquote {{
            border-left: 4px solid #3498db;
            margin: 15px 0;
            padding: 10px 20px;
            background-color: #f8f9fa;
            font-style: italic;
        }}
        ul, ol {{
            margin: 10px 0;
            padding-left: 25px;
        }}
        li {{
            margin: 5px 0;
        }}
        .cover {{
            text-align: center;
            padding-top: 150px;
        }}
        .cover h1 {{
            font-size: 36pt;
            border: none;
            color: #1a5276;
        }}
        .cover .subtitle {{
            font-size: 18pt;
            color: #666;
            margin-top: 20px;
        }}
        .cover .version {{
            font-size: 14pt;
            color: #999;
            margin-top: 40px;
        }}
        .cover .date {{
            font-size: 12pt;
            color: #999;
            margin-top: 10px;
        }}
    </style>
</head>
<body>
    <div class="cover">
        <h1>🦊 FoxClaw AIOS 🦞</h1>
        <div class="subtitle">智能代理的 AI 操作系统</div>
        <div class="subtitle">The AI Operating System for Intelligent Agents</div>
        <div class="version">版本 1.0.0</div>
        <div class="date">发布日期：2026年3月</div>
    </div>
    <div style="page-break-before: always;"></div>
    {html_content}
</body>
</html>'''

# 生成 PDF
HTML(string=html_full).write_pdf(output_pdf)

print(f"PDF 生成成功！")
print(f"输出路径：{output_pdf}")
