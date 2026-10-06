plugins {
    id 'fabric-loom' version '1.6-SNAPSHOT'
}

version = project.mod_version
group = "com.example"
base { archivesName = "oban-mod" }

repositories {
    maven { url = "https://maven.maxhenkel.de/repository/public" }
}

dependencies {
    minecraft "com.mojang:minecraft:${project.minecraft_version}"
    mappings "net.fabricmc:yarn:${project.yarn_mappings}:v2"
    modImplementation "net.fabricmc:fabric-loader:${project.loader_version}"
    modImplementation "net.fabricmc.fabric-api:fabric-api:${project.fabric_version}"

    // Simple Voice Chat API (컴파일용)
    compileOnly "de.maxhenkel.voicechat:voicechat-api:2.5.0"

    // Vosk 음성 인식 (모드 jar 안에 포함, JNA는 마인크래프트 것 사용)
    implementation("com.alphacephei:vosk:0.3.45") { exclude group: "net.java.dev.jna" }
    include("com.alphacephei:vosk:0.3.45")
}

tasks.withType(JavaCompile).configureEach { options.release = 17 }
java { sourceCompatibility = JavaVersion.VERSION_17; targetCompatibility = JavaVersion.VERSION_17 }
processResources { inputs.property "version", project.version; filesMatching("fabric.mod.json") { expand "version": project.version } }

org.gradle.jvmargs=-Xmx1G
minecraft_version=1.20.1
yarn_mappings=1.20.1+build.10
loader_version=0.15.11
fabric_version=0.92.2+1.20.1
mod_version=1.0.0

[사용법]
1. github.com 가입/로그인 -> New repository (이름 아무거나, Public) 생성
2. "uploading an existing file" 링크 클릭 -> 이 폴더 안의 모든 파일/폴더(.github 포함!)를 드래그해서 업로드 -> Commit
3. 상단 Actions 탭 -> build 실행이 끝날 때까지 대기(약 3~5분, 초록 체크)
4. 실행 결과 화면 맨 아래 Artifacts의 oban-mod-jar 다운로드 -> 압축 해제 -> oban-mod-1.0.0.jar
5. 방장 mods 폴더에 jar + Simple Voice Chat 넣기, 게임 폴더에 oban_model 폴더 넣기

pluginManagement {
    repositories {
        maven { url = "https://maven.fabricmc.net/" }
        mavenCentral()
        gradlePluginPortal()
    }
}
rootProject.name = "oban-mod"
