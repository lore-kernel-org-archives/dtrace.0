Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164902D2397
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383390; cv=fail; b=fTTPDyd9XxqKxDOIeGQ57GLGOPK3L1JhlshJ0oBKbBpmZEOPF21Scc58upKMy+4yyko7xvDnxI3G/v1Z/vcCWjlAZzP7fR628M6dQmrdZeLqJ5fvoaYTRKh1NtsdFvjaDHXmAo04eQwfPJR9h2YVmOEcLLAtNRpC5CGoStwFI24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383390; c=relaxed/simple;
	bh=Pm1C7YHV06Ms32M6oSLT5vM2mZLCfKOfTv60BVphinQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ROhEn3j4TXSJlmRwWcxhoMuPUrB8bVPiYzHx9shO/s6GruOvi1KhOCSSgDjUfVVvk5E5ZhPP8yXnZMAv5IJtWe6WQkftEOUY2gsD2BQ1ONTbzZ1SBj8KzkFLH2BhndLWG4YezlcR+suct3YWWfxIVbSJedTZUSQKrHOzOBeS5vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cXGIQt95; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IuBLOMYJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cXGIQt95";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IuBLOMYJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiwIu011761
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=E3Do3sgVrodZeFLKfPTsCmmHOQYRqbFCbQswp20tnyE=; b=
	cXGIQt95/DqFcuDYFYEpHVT3aDnAnNSUXO/Y1Kc8eG1tGTFwQxKdGbGmYLFxymAP
	MPk97SOVDf1O1w+HLtuA8BZh8s2O2SILME+u5nqFBt1sUsOJ+xlc6fs/WholYt74
	8FcEAb1OBfTfbZzT+7M/zHsww39ad5+5jGmKHNx77IYIBwVkjFaPxgwVn5K0xqlw
	A4l9xGoqII1V8oyCU8A7gfPT9Aq/6XcJPR0puMQ8WL2q9r5NuAy4R8SPvlA4H6/e
	o9ZVEDDFoETs4wFz946v7SaWjfXJcnOqjzuqa69eAHkANMJY44q5QwFWjvaVRhRO
	sBuuvHIGF2JfUXYnRllO9A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpt9sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:56:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OHNa3l031545
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:56:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tjj4f3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX0vyIh83ntPdR9uRQW2LAjIPmLouNzeboWGT5eq55vbFyzVTTHOx/W5OGqdjQ+gJydL/giTckBnuONzKjcLt0SYVYQgQxCL4+f45d13Ev9s9HZiEjU0K83P59MYtJN8/+yv6SyeDD3TO50QuFhAel9Q9qstyFi5ApcswFsCNhYDN7vdQ7lOqhLT1jznIQn/0Yg4bb6WIaLKzhM7vZMgtZPe4vh0AFLa+X9ugmToYJKvBIA6jjJChyw32Oq/2qOFCaJleDATRNCNoWEhNOHmVwfpDXLMuY7QP/JkWM0VFc7fE06J1rJwn+KPFMtUerF8mFhgWPDtTR/sq4ywT7JrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3Do3sgVrodZeFLKfPTsCmmHOQYRqbFCbQswp20tnyE=;
 b=d6bpciwrxugtjzaY+qQ/ddMdOAywORz37cWrWt+2zVFNvtw9zARXdJVntclZhsgOUeufX6XeyjfHdw0Xu9MaF2BXboopA5nTSjreQbnQYNnlbJONp3rnrSoutWKbpgI8znxagCQKFwaJvwvMFBi4R8vCTuCwPJ3Wv8evd869H6gFta1wzD+adsdGshbJMg7I2rR9aeV/76p8o44eCUi70ud3ZYqjfDn3P438WHcL+FgXi5aJgW+96vPPucNPj4JCYdjxvrGQcbm3HhGc61ukecWkJT6iRQoVW8eeMO4DLHP87nfgwHdti6lKGMfg31fX163Bvyp+rQlmF7SpSvBJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3Do3sgVrodZeFLKfPTsCmmHOQYRqbFCbQswp20tnyE=;
 b=IuBLOMYJdmP7H5vQnlEmLOZcLx6X08PDrgDqnDnm+I4GgNZIXpBOAL8VzWrVJN0Jx3bMiBp5/r2l8JQI5r2uoRuCCzwgI+7F05X533kwRw+EgmqJYKF8O1IEbYaBp+p9GzpoL/QgXd2XHvvI9LwyquNBLWNpaywHzeZ4TGHybSk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB5830.namprd10.prod.outlook.com (2603:10b6:510:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 18:56:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 18:56:21 +0000
Date: Thu, 24 Jul 2025 14:56:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] btf: fix symbol BTF ID lookup
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56726C5DD50A9020370699DAC25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: da185c0d-d49e-44ba-68b5-08ddcae3c7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0xPWG03RWGGKaTjZibHuZ9/HKgWUSs7d/Z8gosYro6mfQ7fiKI7Oq109GdH?=
 =?us-ascii?Q?Xve/tGHYaGNzOvICZAzBdcxpBkWyjTYfK2LL+lt43CWQe3JhRDngRVTjRcDa?=
 =?us-ascii?Q?HCgphL53vyQzBHtm3Q5naZ/FzFQOfnIQ9/zdNeIZ5TCuvumWUXmzRJRpT4w+?=
 =?us-ascii?Q?iDHX++wYYVyEst5fJnePfeW80IN+ng0pHkw4xZqcqc2HxxcgTmaZ5v3tbslO?=
 =?us-ascii?Q?iLKMwPHOJqUUsgqCwu8dHIkM5rwNTBOZTNerqVNMnX1KkpPoqfSZPNmD0Tzn?=
 =?us-ascii?Q?br+Ic2RJNTKk2CtwOavsUiNaGtAgg08ygHEhUvMSEBnX/qmpbw9moxWN5kub?=
 =?us-ascii?Q?HTOSxDq68TMt/O9hMJEbrjJytNBbJz+oaP4aHo0BghUOQDD9jVPZKPb5+XEO?=
 =?us-ascii?Q?cMhceznfelsedh3ZtzwUTOYK0a9zP0Xqewu0EzKRi6WgScT8f+YAtKVB3HPr?=
 =?us-ascii?Q?s5TGGGFzeK6Y9Si4Pp0fso9w9nK02lnqYGJ2I8pdihV19YNfIAfz3rlpEJ42?=
 =?us-ascii?Q?Jtq7smkpIh+SLfT22i4wCLtWUNufyXvHGVUq7hmHZfKh5axAWkfqyaSqzd1t?=
 =?us-ascii?Q?k8qrvDPvi6I3tNNXp7kqltUCEMQnE4D2gPt9/epVipBf6RCZLrrPDpFwzi1I?=
 =?us-ascii?Q?Jj1ZvG7Hk4VeIbmP0yoJRoS2BwyP21Wp4rb6Vo7gutNK18LILKNVsEGntu/2?=
 =?us-ascii?Q?Dbm8fzPijzrOLZB9E8OK1XhDvtoC8bKO2SWdmSH1EBA3dYxcro9NX4pqNV+O?=
 =?us-ascii?Q?VVrfWZpoIRJ54WW4qg82bJAvNg8tDVRpMlcJ8mtJWxXtSUbLh1NwzWHJzPti?=
 =?us-ascii?Q?dz8+7AewHZtFA+DJQSrnXvbo7QonM+LuGkoq80a+O0cd4gRjvJlL4rTf6rRg?=
 =?us-ascii?Q?UqymcwwYdszyqMIeqiPHynPNPbgRYAwJ2m6V7JcX1ZxxNRHe9xbJ+aHt8ztE?=
 =?us-ascii?Q?CwjxNIHQBhatpp0vGWFYXQcREB4XlB1YgMoaGzIaPSE1u/CuNEQGzJGqU0pO?=
 =?us-ascii?Q?GYphACKJNYt/UjaK7Tz+vdPU7hobsgrzvt0V6JDFl2R6rv8l+lxrWgmnwv1D?=
 =?us-ascii?Q?ofK/Sd34yl8EgjAn4Hy5WdMk6cmFbY8HjKL6OeisDF22uRJwo43r0y8qaFO8?=
 =?us-ascii?Q?rcDowa3jkecaCLUnC0rHUQBPt5MDu2cnJivX8Z1eD9qe9OaWf1xE29RyjOkn?=
 =?us-ascii?Q?Q3RGLn1RTmMnL8Pf2uq3hO/gbCi/A0doL3k4ITZ+oc46Q3AqWgMpy8zSsb7f?=
 =?us-ascii?Q?l2+hxnIhLeXcOFChdU0cbxDcxyJDTg4CIxbHBs/VAeoTlxYScVos6H2+zPgS?=
 =?us-ascii?Q?0vUYG3thWdsU83uBiFwcItMoPVrvHPgfmCN+tO/c3EAKJwCktijYkJE1hmwZ?=
 =?us-ascii?Q?wcy/ME6r2uL8kcCmYFB/LotAAha/C4mshgOahrAhVKosf8oxDQ5Jtdg+bV2b?=
 =?us-ascii?Q?5c77X2k1QcM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4gzlzw1o8/xrxCmTqB+ORt/zMJFrtMu02D6R3+xo8V6FC+ZZ9eNVlsPRw4x4?=
 =?us-ascii?Q?MHp4fh+8PDJLN74agYK9pBOmEJRPp6AGMIqgiNQIfviKl/KKuReSJ09xZbEe?=
 =?us-ascii?Q?obxp7oM8afseJiBj++DC9rVjkA8o2N2LB04qj1FgZ1iOEsALpeijk+K6HaOR?=
 =?us-ascii?Q?q+YFdWFqVjhOC+mtqgN8SV2uNxLyr4pj/Rf4ovcQd93+T7IrHO8X+ov04V3O?=
 =?us-ascii?Q?pFHfuUiArjtPP6gGDEjbcflT+i31WyXwmA6Y8HgLwtIdpNN7k0ZBDI7wjmHB?=
 =?us-ascii?Q?8aD4Ka+gA8bkAnwGoOFndBaKQLUj+ETEUKGRidFkYoJ98GrbwgR2HwU/2Ukm?=
 =?us-ascii?Q?G77edrwaG/CdEbdFxM8v+nRyUhMkEzxxdq2btUiPgawbJ/yP50VwoxYoYvqC?=
 =?us-ascii?Q?Aio3UOS+zRLA0UYNuy2hJW6hLhXHEIQgYpFHDwx4GYbhziqg5BmLf1xZb10d?=
 =?us-ascii?Q?TPDXc8Lz1VJ+iCRWMkRvcYGQDv6gbv0gedkNLwfuPWs+cG+JvbWrwLsfgwIP?=
 =?us-ascii?Q?ewzt+Ei60ht9j40dbubq4T62A6HJlfqatK4W8SPlhD1jk785em20/ETWGVGh?=
 =?us-ascii?Q?6pOl5efLbSBv6xuNIqQOh57m6HQnKCfJ5yQz/XV5aqopkjO1Oc7RGMkioBeB?=
 =?us-ascii?Q?vYm9efgeL8++3HkyzjEcedUSMWtC+XF8ZubShEAlr8uwTJ3DidDazEeXHm1K?=
 =?us-ascii?Q?Po6fQ/eDyDbSJ0ChGTP5lzA2ZA/8bxkEkU4pM04jePYYcKXA6A/3gWQZc388?=
 =?us-ascii?Q?FuiNMlc1AJ0pXJ/U/WTcesSaHj6c/pNgJNN0fFUNc0mDzbO5NhoCpFrhcCBt?=
 =?us-ascii?Q?kTmo/j93ekWXeSSmdI/2b6FldsLCN0fNQlEQmA4jhI8B/gIoVzYeAVprhhuQ?=
 =?us-ascii?Q?7/T5vRTSPfgFB1h86uzzhxCjHv8rhkR9Lg4L5UjdKlitBFOMBvAPmBTw956X?=
 =?us-ascii?Q?hvqA1yiBeb/xKKfDGYWUrKZnib0SHHDaQ2hTW0SeMjlSYAz5WlCrJoi4LVxh?=
 =?us-ascii?Q?wDaM3Qg6ec8BVXX+1+i/vIZb4cyEKZ0Nan4q6cKVqCZ07Mhis78wWQ/7wgBK?=
 =?us-ascii?Q?IRO0oPN23SpeSV7a99l5+G91z/9IvDEmcRsQy4P08u38Cu5sfE4WXZXCCEbj?=
 =?us-ascii?Q?w4DzpX2tlK/aOdasAqX2R3y5uCzEyaYKirWBGdM+Z0oNPbyDisqLLi3QKsx8?=
 =?us-ascii?Q?ZKUPylC/mpKAvJfEDsZWxYXcrOFSj7u5QmVOxdK0ELuh9UGUuDCteYPt9SeG?=
 =?us-ascii?Q?2iuUVsFoN4sMUXfOQWFuH50KiUL3y9SFn86VUmPWG7qT7muOGEwloahYUitn?=
 =?us-ascii?Q?N/kj4XPR9lLXdcavcOY+7WLV/OPhg3nDvfyJD3VUMLNT4eQJD5MG5vRPMGhZ?=
 =?us-ascii?Q?N14nCiB5QClUiMTD8eizJoNkCROzYsOh13VBaOYNG/UzpQdNeum3/t5zdXGi?=
 =?us-ascii?Q?dmIxASdFrOxLh0Y0hg+O/O2DZs0t0wjgSTtqbbxzyQYTWKZDLmrF35r+NDsE?=
 =?us-ascii?Q?UbN39n3dEKMPrMCLYVJC2iCv0Sc73rqigyfqTB/mn0u+pQMN/YAPwOFQQubS?=
 =?us-ascii?Q?FJZZ3itAP156LhMf/2xjEm62PukLqlbjSgpaie9e3BdZLINA1RhNyb8e5OAL?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E8UKgBgxSlDZM9xPPQUK2MMi57NuPQdiK9lEyJz2slgkWF8YbeMRfMWYWKlF6Gyg1Pxt6OUAkU8RwKCAvTbyPsHIIFInaSA9v+XaD9NOMkqWfwylvRVKf6S1BjK8yTg7y7bq0eFzMDN59PZVoDqUj8/GhLF9cGm4E1WoYuZQ6U3Ouo/hE2LdZn38U99yteMb18YUr9sMioHeHyOu9/3UZyXQJCGDs2/BPfw/3unrd80TTPjjeHv5gc5MhnK7e+XzXYir4v0aBONq0MjRZFrYsfKuhjYJXRDLKIYue774kZyNQNPp563peyP8o5tO/aDc/dsYfmAoXGEfSwPvsXiDpWUbvK4J3wl+vyV659d0dzqr+2HJylaMyg2oaWuERSvWGzigkGL1ub/FVaeZn7E9/3YhnndAR9GCkb4ow6NIHKcc1NkwHEGf5NDMo0lf8v8+CJRfTEIkikdhwqzHJ+Pru3nSM0oapw1IIeyUTHtyRKUppikcwUrI2sxiHLffa3anQx9ozp7wFuHeoNtveRLzedXGLiyBtrDXPNtc+nFTSePPQL2+IFGVYlplZo3nUgW5dRwyJvy4rVQjd8LesPnozGSkQH7YjsJV2C7v9SMWxAQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da185c0d-d49e-44ba-68b5-08ddcae3c7e9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 18:56:21.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +amzosEtkElSA9oNWevgX6CrAoRk/u/dhgc4eu0yV0Cxl+b6vK1CWfuFwGHrzzn/Lhhm2S2uUi0ElAzj9vO0daYNWA1vqHEfobpIKcyIZFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240146
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=688281db b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=h6pjA5XVxrC0Qfk2CG8A:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: uVn3h8MBwyJ1pMoXwog-CkUmZKGXDMab
X-Proofpoint-ORIG-GUID: uVn3h8MBwyJ1pMoXwog-CkUmZKGXDMab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0NiBTYWx0ZWRfX+cbGXO7bRpre
 ynjsJvEWE78a8js6J8Z2UhLz1QbNUAIW0N0d+rWCWRZWnMeCYVGMLiuGmIi31UI5y9XKrmP/R0o
 VgDSwSvFWCxILoJilihDPkNWI1mdiYeVzqCpNvTjxDD0Xc0wE4rbGvjvsWddT7CN700oGJ6HVhT
 RnUFelujpuSRUFZ46fmEXYeYtScnXzwnCWs/ZOwsk5miAgAXxSBcawbRVMGu3iVAr39k9YpnKs4
 koe4S7lO3zSZtWJHOUvTYMDiiQ6dFca2p2oHlnnBbEOeCR6WYQ2MUD11F0fhfVS2Z5msgZhY20Z
 G0g0VjjHwiX4QRriqde2C36WrghGCe3HMCD78DFx1UTzB/5foTzdtF1uBzH5N7CkJOfmHd5ezrX
 HMrbM6ljUCNhqLOwYMVkibLE3rQRSMw3DUG4kteU8btgiX0qF2k4vyrORBPuZGZBYl9XXKCJ

The logic to perform a BTF ID lookup for a symbol did not guard against
BTF data not having been loaded for the module that contains the symbol.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c      |  2 +-
 libdtrace/dt_btf.c      | 32 +++++++++++++++++---------------
 libdtrace/dt_btf.h      |  2 +-
 libdtrace/dt_prov_fbt.c |  3 +--
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 2ae7fed1..ccec8b43 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -523,7 +523,7 @@ dt_bpf_init_features(dtrace_hdl_t *dtp)
 {
 	uint32_t	btf_id;
 
-	btf_id = dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
+	btf_id = dt_btf_lookup_name_kind(dtp, dtp->dt_exec,
 					 "bpf_get_btf_vmlinux", BTF_KIND_FUNC);
 	if (btf_id >= 0 &&
 	    have_attach_type(BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, btf_id))
diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index e9ead435..b84bba73 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -867,29 +867,32 @@ ok:
 }
 
 int32_t
-dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_btf_t *btf, const char *name,
+dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
 			uint32_t kind)
 {
-	int32_t	i, base = 0;
+	dt_btf_t	*btf = dmp->dm_btf;
+	int32_t		i, base = 0;
 
 	if (kind == BTF_KIND_UNKN)
 		return -ENOENT;
 	if (strcmp(name, "void") == 0)
 		return 0;
 
-	/*
-	 * Ensure the shared BTF is loaded, and if no BTF is given, use the
-	 * shared one.
-	 */
-	 if (!dtp->dt_shared_btf) {
-		  dt_btf_load_module(dtp, dtp->dt_exec);
+	/* Ensure the shared BTF is loaded. */
+	if (!dtp->dt_shared_btf)
+		dt_btf_load_module(dtp, dtp->dt_exec);
 
-		  if (!btf)
-			   btf = dtp->dt_shared_btf;
-	 }
+	/* If the module does not have BTF data yet, try to load it. */
+	if (!btf) {
+		btf = dt_btf_load_module(dtp, dmp);
 
-	 if (!btf)
-		  return -ENOENT;
+		/* If no BTF momdule data was found, use the shared BTF. */
+		if (!btf)
+			btf = dtp->dt_shared_btf;
+
+		if (!btf)
+			return -ENOENT;
+	}
 
 	/*
 	 * Any module other than 'vmlinux' inherits the types from 'vmlinux'.
@@ -915,8 +918,7 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_btf_t *btf, const char *name,
 	}
 
 	if (base > 0)
-		return dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
-					       name, kind);
+		return dt_btf_lookup_name_kind(dtp, dtp->dt_exec, name, kind);
 
 	return -ENOENT;
 }
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index e05b30d0..18fc70b5 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -21,7 +21,7 @@ extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
 extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
 extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
 extern const char *dt_btf_get_string(dtrace_hdl_t *, dt_btf_t *, uint32_t);
-extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
+extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_module_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 2dd2b7f6..0ba20988 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -350,8 +350,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (dmp == NULL)
 		goto done;
 
-	btf_id = dt_btf_lookup_name_kind(dtp, dmp->dm_btf, desc->fun,
-					 BTF_KIND_FUNC);
+	btf_id = dt_btf_lookup_name_kind(dtp, dmp, desc->fun, BTF_KIND_FUNC);
 	if (btf_id <= 0)
 		goto done;
 
-- 
2.43.5

