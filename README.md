🚀 커밋 메세지 규약
==========================
이 문서는 [the AngulerJS commit conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/)를 번역한 것입니다.
> 🖋 번역 : [outstandingboy](https://github.com/outstanding1301)
> 공부하면서 번역했습니다. 입맛대로 번역된 부분이나 오역이 있을 수 있습니다.

## 📌 목차

* [목표](#-목표)
* [CHANGELOG.md 생성](#-changelogmd-생성)
  * [중요하지 않은 커밋 식별](#-중요하지-않은-커밋-식별)
  * [히스토리 탐색 시 더 많은 정보 제공](#-히스토리를-조회할-때-더-많은-정보를-제공)
* [커밋 메세지의 형식](#-커밋-메세지의-형식)
  * [제목 행 (Subject Line)](#제목-행-subject-line)
    * [`<type>`에 들어갈 수 있는 항목들](#type에-들어갈-수-있는-항목들)
    * [`<scope>`에 들어갈 수 있는 항목들](#scope에-들어갈-수-있는-항목들)
    * [`<subject>` 제목 작성 시](#subject-제목-작성-시)
  * [메세지 내용 (Message Body)](#메세지-내용-message-body)
  * [메세지 하단 (Message Footer)](#메세지-하단-message-footer)
    * [주요 변경 내역들 (Breaking Changes)](#주요-변경-내역들-breaking-changes)
    * [해결된 이슈 (Referencing Issues)](#해결된-이슈-referencing-issues)
  * [예시](#예시)
  
⚽ 목표
-----
✔ 스크립트로 CHANGELOG.md를 작성할 수 있다.  
✔ git bisect를 사용하여 중요하지 않은 커밋을 무시하게 할 수 있다.   (포매팅 같은 중요하지 않은 커밋)  
> **git bisect?**
> 커밋의 특정 범위 내에서 이진탐색을 통해 문제가 발생한 최초의 커밋을 찾는데 도움을 주는 git의 기능
>
> 출처 : [곰돌푸우❤️ 님의 블로그](https://simsi6.tistory.com/97)

✔ 커밋 히스토리를 탐색할 때 더 좋은 정보를 제공한다.

✏ CHANGELOG.md 생성
-----------------------
변경 내역엔 다음 세가지 내용이 포함합니다.
- 새로운 특징 (new features)
- 버그 수정 (bug fixes)
- 주요 변경 내용 (breaking changes)

배포 시 스크립트를 사용해서 관련 커밋에 대한 링크와 함께 위 내용들을 생성할 수 있습니다.  
물론, 실제로 배포하기 전에 변경 내역을 수정하고 배포할 수도 있습니다.

최근 배포 이후의 **제목** 목록을 출력합니다.
> 제목(subject) : 커밋 메세지의 첫번째 줄
```bash
git log <last tag> HEAD --pretty=format:%s
```

이번 릴리즈의 새로운 특징들을 출력합니다.
```bash
git log <last release> HEAD --grep feature
```

### 😒 중요하지 않은 커밋 식별
중요하지 않은 커밋은 주로 로직의 변화가 없는 커밋입니다.  
예를 들면...
- 포매팅 변화 (공백이나 빈 줄의 추가, 제거, 들여쓰기)
- 세미콜론 누락
- 주석

따라서 변경 내역을 조회할 때 위와 같이 중요하지 않은 커밋은 무시해도 됩니다.

git bisect를 사용하여 이진 탐색할 때  
다음과 같이 중요하지 않은 커밋을 무시할 수 있습니다.

```bash
git bisect skip $(git rev-list --grep irrelevant <good place> HEAD)
```

### 📃 히스토리를 조회할 때 더 많은 정보를 제공
일종의 "문맥" 정보를 추가합니다.

다음은 angular의 최근 커밋들 중 일부입니다 :
* Fix small typo in docs widget (tutorial instructions)
* Fix test for scenario.Application - should remove old iframe
* docs - various doc fixes
* docs - stripping extra new lines
* Replaced double line break with single when text is fetched from Google
* Added support for properties in documentation

모든 메세지들이 어떤 변경이 발생했는지 명시하려 하지만  
공통적인 규약이 있는 것 같지는 않습니다.

다음 메세지들을 봅시다 :
* fix comment stripping
* fixing broken links
* Bit of refactoring
* Check whether links do exist and throw exception
* Fix sitemap include (to work on case sensitive linux)

이 메세지만 보고는 어느 부분이 변했는지 알 수 없습니다.  
따라서 docs, docs-parser, compiler, senario-runner와 같이 어디가 변경됐는지 알려주는게 좋겠죠.

물론, 변경된 파일들을 일일히 찾아보면 알 수 있겠죠... 하지만 그건 느립니다.  
그리고 git history들을 보면 어디가 변했는지 명시하려고 하는건 보이지만, 단지 규약이 없을 뿐입니다.

---

⚡ 커밋 메세지의 형식
----------------------------
```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

커밋 메세지의 각 줄은 100자를 넘기지 말아야 합니다. 그래야 읽기 쉽습니다.

> 커밋 메세지를 작성하기 위한 도구들입니다.
> [✨outstandingboy's commit script✨](https://github.com/outstanding1301/commit)
> [IntelliJ IDEA의 Git Commit Template 플러그인](https://plugins.jetbrains.com/plugin/9861-git-commit-template)


### 제목 행 (subject line)
`<종류>(<범위>): <제목>`
커밋 메세지의 첫번째 줄인 제목 행은 변화에 대한 간결한 설명을 포함합니다.

#### `<type>`에 들어갈 수 있는 항목들
* feat (feature, 새로 추가된 것이나 특징)
* fix (버그 수정)
* docs (문서)
* style (포매팅 수정, 들여쓰기 추가, …)
* refactor
* test (누락 테스트를 추가할 때)
* chore (유지보수)

####  `<scope>`에 들어갈 수 있는 항목들
어디가 변경되었는지, 변경된 부분은 모두 들어갈 수 있습니다.  
예를 들어, $location, $browser, $compile, $rootScope, ngHref, ngClick, ngView, 등등...
> 이름이 들어가면 어디가 바뀌었는지 알기 쉽겠죠?
> 함수가 변경되었으면 함수 이름이나.. 메소드가 추가되었으면 해당 클래스 이름을 넣으면 되겠네요.

#### `<subject>` 제목 작성 시
* 명령문, 현재 시제로 작성합니다.
  > 예를 들어, 변경되었으면 : "change"를 사용합니다. "changed"나 "changes"를 사용하지 않습니다.
* 첫글자를 대문자로 쓰지 마세요. 소문자로 쓰세요.
* 마지막에 마침표(.)를 붙이지 마세요

### 메세지 내용 (Message Body)
* 명령문, 현재 시제로 작성하길 권장합니다.
* 변경한 이유와 변경 전과의 차이점을 설명합니다.

http://365git.tumblr.com/post/3308646748/writing-git-commit-messages
http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

### 메세지 하단 (Message Footer)

#### 주요 변경 내역들 (Breaking Changes)
모든 주요 변경 내역들은 다음과 함께 하단에 언급되어야 합니다.
- 변경점 (description of the change)
- 변경 사유 (justification)
- 마이그레이션을 위한 주석 (migration notes)

```
BREAKING CHANGE: isolate scope bindings definition has changed and
    the inject option for the directive controller injection was removed.
    
    To migrate the code follow the example below:
    
    Before:
    
    scope: {
      myAttr: 'attribute',
      myBind: 'bind',
      myExpression: 'expression',
      myEval: 'evaluate',
      myAccessor: 'accessor'
    }
    
    After:
    
    scope: {
      myAttr: '@',
      myBind: '@',
      myExpression: '&',
      // myEval - usually not useful, but in cases where the expression is assignable, you can use '='
      myAccessor: '=' // in directive's template change myAccessor() to myAccessor
    }
    
    The removed `inject` wasn't generaly useful for directives so there should be no code using it.
```

#### 해결된 이슈 (Referencing Issues)

해결된 이슈는 커밋 메세지 하단에 Closes 키워드와 와 함께 기록되어야 합니다.
```
Closes #234
```

해결된 이슈가 여러개인 경우는 다음과 같이 쓸 수 있습니다.
```
Closes #123, #245, #992
```

예시
--------
```
feat($browser): onUrlChange event (popstate/hashchange/polling)

Added new event to $browser:
- forward popstate event if available
- forward hashchange event if popstate not available
- do polling when neither popstate nor hashchange available

Breaks $browser.onHashChange, which was removed (use onUrlChange instead)
```

```
fix($compile): couple of unit tests for IE9

Older IEs serialize html uppercased, but IE9 does not...
Would be better to expect case insensitive, unfortunately jasmine does
not allow to user regexps for throw expectations.

Closes #392
Breaks foo.bar api, foo.baz should be used instead
```

```
feat(directive): ng:disabled, ng:checked, ng:multiple, ng:readonly, ng:selected

New directives for proper binding these attributes in older browsers (IE).
Added coresponding description, live examples and e2e tests.

Closes #351
```

```
style($location): add couple of missing semi colons
```

```
docs(guide): updated fixed docs from Google Docs

Couple of typos fixed:
- indentation
- batchLogbatchLog -> batchLog
- start periodic checking
- missing brace
```

```
feat($compile): simplify isolate scope bindings

Changed the isolate scope binding options to:
  - @attr - attribute binding (including interpolation)
  - =model - by-directional model binding
  - &expr - expression execution binding

This change simplifies the terminology as well as
number of choices available to the developer. It
also supports local name aliasing from the parent.

BREAKING CHANGE: isolate scope bindings definition has changed and
the inject option for the directive controller injection was removed.

To migrate the code follow the example below:

Before:

scope: {
  myAttr: 'attribute',
  myBind: 'bind',
  myExpression: 'expression',
  myEval: 'evaluate',
  myAccessor: 'accessor'
}

After:

scope: {
  myAttr: '@',
  myBind: '@',
  myExpression: '&',
  // myEval - usually not useful, but in cases where the expression is assignable, you can use '='
  myAccessor: '=' // in directive's template change myAccessor() to myAccessor
}

The removed `inject` wasn't generaly useful for directives so there should be no code using it.
```
