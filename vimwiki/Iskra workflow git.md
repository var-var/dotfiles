
//----------------------------------
1. Своя ветка, Merge request(MR):
  - git log
  - git status

  - git commit -a -m "..."
  - git status
  - git push  
      (copy-past'ом -> ...origin)

GitLab (web-page) -> UMP_APP ->
     -> create merge request -> Title: !Jira №Task ->
     -> assigne: pkun
     -> reviewer: pkun
     - [X] delete source...
     - [X] squash

+------------------------------------------------+
| git branch -a                                  |
|                                                |
| git chechout -b BRANCH_NAME origin/BRANCH_NAME |
+------------------------------------------------+

Чтобы увидеть расхождения текущей ветки с master:
   - git merge master

//----------------------------------
2. Если конфликт (blocked merge request(MR) на GitLab:

  - git fetch origin
  - git checkout master
  - git pull (возможно удалить untracked files) / git pull --recurse-submodules
  - git checkout "MY_BRANCH_NAME"
  - git merge master:
    если [OK]: 
         - git push
        
//----------------------------------
3. Обновление сабмодулей (submodule update)
  - git stash
  - git checkout master
  - git pull

  - git checkout BRANCH_NAME
  - git merge master

  - ggit submodule update --init --recursive --remoteit submodule update --init --recursive --remote
  
  - git stash pop
  
  
//----------------------------------
gui ump на макете: (firefox)
192.168.24.9
login: mnadmin
passw: mnadmin
//----------------------------------
Включение трассировки для тестов googleTests
//---------------------------------------------------------------------------------
class UEContextMngTest : public ::testing::Test
{
public:
  virtual void SetUp() override;
  virtual void TearDown() override;

  static void SetUpTestSuite() {
        ::testing::FLAGS_gmock_verbose = "info";
    }

protected:
  UEContextMng         * _ueCtxMng;
  StrictMock<UEContextMngUserMock> * _user;

  MmeParams _mmeParams;
  MapPlmnParams _plmnsParams;
  MapMmeUEAttachWhitelist _mmeUEAttachWhitelist;

  const Imsi          _imsi{"001010000123456"};
//--------------------------------------------------------------------------------


