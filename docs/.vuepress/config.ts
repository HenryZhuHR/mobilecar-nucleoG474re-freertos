import { defaultTheme, defineUserConfig } from 'vuepress'
import sidebar from './configs/sidebar'

export default defineUserConfig({
    lang: 'zh-CN',
    title: '移动机器人运动控制文档',
    description: '移动机器人运动控制文档',

    theme: defaultTheme({
        // 侧边栏数组
        // 所有页面会使用相同的侧边栏
        sidebar: sidebar
    }),
})