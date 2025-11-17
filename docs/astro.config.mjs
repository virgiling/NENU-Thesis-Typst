// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import starlightGiscus from 'starlight-giscus';
import starlightViewModes from 'starlight-view-modes';
import starlightSidebarTopicsPlugin from 'starlight-sidebar-topics';

// https://astro.build/config
export default defineConfig({
	site: "https://thesis.virgiling.wiki",
	integrations: [
		starlight({
			title: 'NENU 论文模板使用手册',
			logo: {
				src: "./src/assets/nenu-logo-blue.svg"
			},
			social: [
				{ icon: 'github', label: 'GitHub', href: 'https://github.com/virgiling/NENU-Thesis-Typst' },
			],
			editLink: {
				baseUrl: "https://github.com/virgiling/NENU-Thesis-Typst/edit/master/docs/"
			},

			locales: {
				root: {
					label: "简体中文",
					lang: "zh"
				}
			},

			expressiveCode: {
				styleOverrides: {
					borderRadius: '0.5rem'
				},
			},

			customCss: [
				"./src/styles/custom.css"
			],

			plugins: [
				starlightGiscus({
					repo: "virgiling/NENU-Thesis-Typst",
					repoId: "R_kgDOMvbOLA",
					category: "Q&A",
					categoryId: "DIC_kwDOMvbOLM4Cx438",
					mapping: "pathname",
					lazy: true
				}),
				starlightViewModes(),
				starlightSidebarTopicsPlugin([
					{
						label: "文档",
						icon: 'open-book',
						link: '/document/',
						items: [
							{
								label: "从这里开始",
								collapsed: false,
								autogenerate: {directory: "document/startup"}
							},
							{
								label: "从这里开始",
								autogenerate: {directory: "document/guides"}	
							},
							{
								label: "参数文档",
								collapsed: true,
								autogenerate: {directory: "document/reference"}
							}
						]
					},
					{
						label: "第三方包结合",
						icon: 'puzzle',
						link: "/external/",
						badge: { text: "New", variant: "tip" },
						items: [
							{
								label: "与其他包的结合",
								autogenerate: {directory: "external" }
							},
						]
					}
				])
			],
		}),
	],
});
