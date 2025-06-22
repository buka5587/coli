# S3协议存储集成开发指南

## 配置参数要求
- **必需参数**  
  `access_key`：API访问密钥  
  `secret_key`：API私有密钥  
  `bucket_name`：存储桶名称  
  `region`：服务区域（如：us-east-1）

  ```php
  // 配置示例（conf.php）
  $wasabi_config = [
    'access_key' => 'AKIAXXXXXXXXXXXXXXXX',
    'secret_key' => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    'bucket' => 'my-wasabi-bucket',
    'region' => 'us-east-1',
    'endpoint' => 'https://s3.wasabisys.com'
  ];
  ```

## 核心实现逻辑

### 1. SDK初始化
```php
// 创建S3客户端实例
$s3Client = new Aws\S3\S3Client([
    'version' => 'latest',
    'region' => $config['region'],
    'endpoint' => $config['endpoint'],
    'credentials' => [
        'key' => $config['access_key'],
        'secret' => $config['secret_key']
    ]
]);
```

### 2. 文件上传流程
1. 检查本地文件存在性
2. 生成唯一存储路径（含日期目录）
3. 执行putObject操作
4. 验证上传结果（HTTP 200状态）
5. 可选删除本地文件（当$delete_local=true时）

### 3. 文件删除流程
1. 验证对象存在性（headObject）
2. 执行deleteObject操作
3. 返回布尔型操作结果

## 错误处理规范
```php
try {
    // S3操作代码块
} catch (Aws\S3\Exception\S3Exception $e) {
    $error_msg = "S3操作失败: ".$e->getAwsErrorCode();
    log_sys_error($error_msg); // 系统级错误日志
    return ['status' => 500, 'error' => $error_msg];
}
```

## 扩展开发建议
1. 新服务商需实现：
   - 独立配置节点（如aws3、wasabi_s3）
   - 端点URL配置项（endpoint）
   - 区域验证逻辑
2. 建议通过继承S3Adapter类实现：
   ```php
   class WasabiAdapter extends S3Adapter {
       // 实现wasabi特定参数校验
       protected function validateConfig() {
           parent::validateConfig();
           if (!filter_var($this->config['endpoint'], FILTER_VALIDATE_URL)) {
               throw new \Exception("无效的端点URL");
           }
       }
   }
   ```