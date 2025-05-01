Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156961AB6F1
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112108; cv=fail; b=MQHtyrcp5QzH6GWKSe09KrSq2IPlD+zcB6iXXQkRh6ShPiKtuC3GuZYheb2P1VQpzOHCKJ+Nzeu0W96V284fNMj1JqxeysPLO73B+PxTfaIk+r+SlgGs4+JG2eaHpeT4ZhUlddPaqd2+QEW0o5jneKe5HpCcMAY5ue8dUikUPho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112108; c=relaxed/simple;
	bh=mwOqtDIf2fY75m94crCMh2yeRRybvWpNMz1FrUv7+PI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=szYFtPgny/OC1y+YBoTa8hMmvvFMOQsvt+1vqHayJwun5GwKEWRYG+Ls5NpL0cj9YJXCe7efjrbs2qG5WewlDslglsXh9LuFRjPv+qH+wZL+o0ajeyLC/KsCS2rP1D1Kj1LeJ037dWwpD5hxI7w9h/5MmRdLo9hth6Y0NF9S9Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZMq7orJo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WF+seEBw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZMq7orJo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WF+seEBw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Etvj6007111
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=qFH5ECQ4Vmf6BAaoAYkVq5brXyxwN4mDPCKsAvIXvIc=; b=
	ZMq7orJoGbj1ltHTDDrxdN0wDRDDLnEx78Uv1bGojD1ObgR9wd05eyXL+mAfqT9O
	OVYMTTVzG0qulzqzkwiu5tXlO4EZX6On2LUeeq9xKCh2nbcdhGEnD9QfBstMoQjW
	Pp70WAFSNhqyj4ZjSfv8NQtDGtcML+IlECfjmf4e1r7Y/p8EITjtLa+0vP6nJ4yw
	dOziPDTgTKRuXzW5xT7cWKhMNqWZouCgkPySmkUD1M2p8GpdEPIWEQ8o9aFtbf7o
	8u+tLHOEw5/llXB6HoijgCLeM/OUtpul9RYuEWRmtn/nF/mz4MZmLjvy6JmRkk1/
	j8f+dBpyo+xdQKF4B+5CVQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uck6e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541F05Z3001325
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:25 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011029.outbound.protection.outlook.com [40.93.6.29])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcmat8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/8TEDC3cJ4xr+1MmdtoqYDopC5+B1aO5YQj20qWkLQqsTPO1ismtHXmYgELz1c1xZMFURZgvYA4zG1rU0VUXMdjGYlCUiz5j92/UuMUtB4GNwREG2B3d7kiG1rZm94QyFzp3hgBRspEhx8WZJpI+/b3q1QNdrUNrudm23AEQ/6KqW/G99o6hJl9alS+gDNC6jGaPJl1h4uWt1Nqt3OGdln57iKruCaXmoeH1h2jvMQt3Eb5Jkoy9ThU3o9ATMnM+GbeJFGwrQg/63weo7OMRmVaHaOUO53Z0RmPDPKJbP/FwKFuFOs4eR1kPD3j/UG62Dr+S+f/bBiQIBaSvHfZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFH5ECQ4Vmf6BAaoAYkVq5brXyxwN4mDPCKsAvIXvIc=;
 b=DMdtdYxQ+xpUoG1sl5CAAZwPp2qmIQVY/RGNQd3F2qGUqjI8AOZY/f7Viq52SCHibxDms1JriRxn9PTiCOLPcu+e0zs60xeXfTsKd9LmTWicbAlsf7FGHa8W2LOSOpMInBOhPdahE+R2OciFB9AmKhuIixbXuVhhKzHrvwC4x/DYUjA6A5m0w+zjx0pMLboz2OBNJ2HS7BaZtzHxlHhosjk05pANtq+ZOLl1yWsdA8uP4eTmhzSU97ttbJoQLGLBEheaPqOP47JkCaw7fWblEGhf/3HavsM3tzxUHh6tTJMOHIanvImlK3P+IxOkUkW/gZMa2rkNRxxf6eXTiVrTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFH5ECQ4Vmf6BAaoAYkVq5brXyxwN4mDPCKsAvIXvIc=;
 b=WF+seEBwfyASkSNKoXIu1uJfzreuH30qsP1HNVVu4U1JTfOAnbMZzrDP/mgwRt1lsLK5+r3iJl5oD0u1+nSIq55eYSLdeC/M5auV4SsBv4WwyJ+58JBbvzsRhZnAeK4/kYRQfbq5UzF3gP/Rqwma86Z278YDre6WfC9dczmX2sA=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DS7PR10MB7179.namprd10.prod.outlook.com
 (2603:10b6:8:ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:08:22 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:08:21 +0000
Date: Thu, 01 May 2025 11:08:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] Only include dt_git_version.h where needed
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Message-ID:
 <SJ5PPF7F7BBD994C251CF1B3D24E2A6A2C9C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DS7PR10MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: cf89b5c2-f3e3-43f9-112f-08dd88c20339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cEIqWomG9KTMupzGd+qUkS1eIOYujSix7g3OauhoVL82pJLTltNhxr6QxuTJ?=
 =?us-ascii?Q?Hw7XFCCyGk+e2ZwjAHvDrWEi2ueHFqtZYC/+FoZunzT9DVS+i4MqkZz1ia6r?=
 =?us-ascii?Q?ihZpYYYC5hmyzPJ7k8Q5HTXrEUCAPRKEZF29MT2nBlI4tIsS4TCAmQLi90Ui?=
 =?us-ascii?Q?n1BTaQFPNur4tR2z8rFnVZfUShqzTndKx7nMRutsDuIAS544qXf/oeeAlpme?=
 =?us-ascii?Q?uMxxJE8z1a4n4tI5lykxzZkPVCz5M2kz5xDQ6iDgeWwbUNpT63bb8T1Xknle?=
 =?us-ascii?Q?lG5hDQ9QxxiTm9oq+m3VVpN3QyVltEYcQPELXzezPyrUbqVPOxjbY0ainFY+?=
 =?us-ascii?Q?w1tXtObTbwK+CrueTjeu8fI1MpiOoYFFMy1zqAWJZj4Yr02HTUPcYa+N7q0B?=
 =?us-ascii?Q?Q2x4ugBo1I6zcIpZyDjRENgk8sWGtLJ/rneuraqM6leD7Kc42TCK5KObNcCH?=
 =?us-ascii?Q?9YDeqBO7O+KnvtOk+TG4rGITH0tN0WnDQlhW3/8FSjoTKR8qjbpXLy8ioHTr?=
 =?us-ascii?Q?l6ZXolDoNgVk+Mgm2ppoi8xBNdlRY9SEGCmXg6fJh0461jlMotOoTR6yOSl0?=
 =?us-ascii?Q?FGX4NWJYXZJrID4a/4NiBy9uuV6nqfbC9W9MHbFvYQR5vFwlaSn6fTgKNI7R?=
 =?us-ascii?Q?dFIoq7WB069uW8WcDjiFXLz3Y8AlrT95rkg4vcIpxb1f+jEgIdKO0R3LSUeW?=
 =?us-ascii?Q?W54tB1xPvmcL03qRknogDsKEABon0fAkX6BEHOMF6NuI6b7Ndz6PLflKvaTC?=
 =?us-ascii?Q?SCEyOEkI+mrFBtAgB1D8X7hV5gBwunUtd+BNSgpCxwWPyOMb6l7ie9dVZTIL?=
 =?us-ascii?Q?9RsQSnasktMjUveivaWGXb99CGDfryllgjvSwULvL/+OmhGPgHt8euDrMnTD?=
 =?us-ascii?Q?mpPe/xxBuSyouQVC0X/mZhLqHVggWlfudSUv1waJNIq5Xt45U+ns/ncK3top?=
 =?us-ascii?Q?BoF7RhSbCMbR/4KnMU7nS9GP+KcYtjzlkqTPc8sUAZUfpX3zHx9T0HBMzSHX?=
 =?us-ascii?Q?mn9W4D66Rp+jWbi+6TPo5xTIps0rhEt2gukZv2dXc+CBCZMwSVoRC0R+y/gL?=
 =?us-ascii?Q?CdFN2HaUmILd4cD50s7u4Bc9cA9x4DxYkiNK2azwhn7ube984+DjgeSaQ8hZ?=
 =?us-ascii?Q?Il/7OM9TovbTYw3scS9cwKxysMlYrJynA+f6AWCYqNIR/9dxAtZtMczvgbQ+?=
 =?us-ascii?Q?MAkkhScyZoFOZ9PHPkbo0NgG13q4K3l1H8mwXe0HmgMGB32Ma8SwK0oJ7rKv?=
 =?us-ascii?Q?nFcjGB4GRux/lovYmNQ6mHVrB35miPFLG2jmInfgsZZ/IueDnLNKOe4xsg0U?=
 =?us-ascii?Q?OyDvRIDLa9ZSbHfhv/YyFPRt29atfrZ2PuyIjU2UjypHLZWCw7VMfknkWitJ?=
 =?us-ascii?Q?j0lz/GPYJCP4F4NePoshxNyDycfnPVJS2V+LlALKVXp7zrgkIePV4T9j9or/?=
 =?us-ascii?Q?Rkyw0nnsapw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v5ZO5pL6dLuZGPw/dQoEvrAi+dy5ZcVvLvXPH+XEI1J1w0KG13b6NRHnfgjr?=
 =?us-ascii?Q?zxEs3G3XYx1Xo6nsIhFIExXVw5iGSoRWzK/rkILstI5HoTgyzik2E4RSJ+vW?=
 =?us-ascii?Q?2f0cRyXyeW7FCJW1r5hdyT8OdVOEBsERXKqZtelEEcwjOIdhwApbVmo2Yd1Z?=
 =?us-ascii?Q?PUkbzXtFdFzzk59r6uPXX67tCEgmptl/zLLnQrqn9pjVSTYLnYoIfaywhOo9?=
 =?us-ascii?Q?H7ImwDCJ95QsNfXK4BNg55xsP9YAaMfa1BCw0/b3evl6yOOFgrWk09GpqxBA?=
 =?us-ascii?Q?fXmoqMRY+5NjzXPBDueJJQW+lqd428ZgupSU0XT//W2P8FmENvdIKK0GCTHe?=
 =?us-ascii?Q?WVtykQIrRXjVOwzTE6K0MvU3bEZonjT6KjCOztoyhYAC0MKVnD4Ay0lQ7jCD?=
 =?us-ascii?Q?tyhvTIl4zKSn9he/GVfbsR71bH1eJM6KTKZhodBjalxN27rmvqK7IVuZDx5P?=
 =?us-ascii?Q?dFMPpgmhrx539mzcLduAHZyHxUfOCXgRrcK+Z5dfc48MAPgNeEiTrwKHBYEM?=
 =?us-ascii?Q?5T651Zm7oY3vfklqQvqyGZGSuBRTqZKn5eL6M5Wzs2fYCky6Gud/bP2TiEme?=
 =?us-ascii?Q?N7McVJuVaxsCxvJl7oPSVaQa/NIWpOadqCmPp8+7nhT5s+yaPcdAXTe8f1gT?=
 =?us-ascii?Q?fN5UQtSrO90QPGttQEYmBSNFo1CzeXEMeufUaVRWkWw2IBv9fiwkh3fJRarW?=
 =?us-ascii?Q?bHrcGpV2y8gPDnlDTTnrFHeFFunphpWfQX5euReCyTaGsFDBvF3dq62x+wzp?=
 =?us-ascii?Q?8CUJSRfNSzyjqJKUgRUDYJ8G2TDKkMFsEKNSUoM2KatkwAXGA0hn9LM0SojM?=
 =?us-ascii?Q?QeJ9w5NMgD8eBqC1mDES8hPi3B7lOpNvuTUDdFH2iolk+ze3xNNStR4+ATGG?=
 =?us-ascii?Q?pmIqtwPShK7V5+LDw1s1zv2+qnDLJpwMlCqB0Mrh9LeA1SZ7P1HXidTq99dG?=
 =?us-ascii?Q?5BeIKEM5Qj0mbSKYSQvKMVPMbuQRWCfD5gwdgVdGZLlYAZILPyEWzSeemzDO?=
 =?us-ascii?Q?adCpJM8Y5R/gNiFkqFwlbETeVTZxAXUVlJ/tgji1pNdx8wKbgQdyp9PzA2KS?=
 =?us-ascii?Q?+QbB9QuYYbZejLm6eLWHfx7U0me65RVY+o0hw8M9f/Vsi+b/pJjUidBN9/KF?=
 =?us-ascii?Q?oovznT5BQhjQQ4gY8932nHTHytovhA9hzVGWg8DEN6/5IRJtKtq+s4RytfSl?=
 =?us-ascii?Q?B8DpMSSBL8e0hxy9SdvNPFrIaMDX/OQCuPgns89rBqNS1NnvKiIL82txelt5?=
 =?us-ascii?Q?XR5Zg2E+1QnsababAUZlRUoYWpmAyaE/yTVHfYxnYAJmgYqsXH2dPDCXPEIq?=
 =?us-ascii?Q?5XJ5P+cwu6xX3Rm++GzLNvHbS0tAKpQqyTmrLyxkGC8O8OqrU8FHANcF+eEr?=
 =?us-ascii?Q?8gdEgYEva7bmenLNzGLW+yJTj8gvYNCJcZRFyTTxUcMN2+ipVBET2miJ78cw?=
 =?us-ascii?Q?4yGPAY/d1UaMh7WX2Z6hruv8b/o6cTijFXRA6jfSLuzwcEiDOT9nKEQX4ywT?=
 =?us-ascii?Q?VwTS9/jqU6vloQatEUiQrXvMgqVCwuBwuH0OVp0geNmdYKf76Nxb8ivnwxBc?=
 =?us-ascii?Q?93X7u4v3iUm13djtSGwo5aQTcYvEv15Il4SbiC/lJbWd6aY4iuNIZDKpnU1d?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SrAxZAJCuaSq3154ildXEFN8YQLAa6UeBs2xKnnCmPUjzXW0na88eUBXftuxOiJppK3xpofIaJUJs0tDYtAtHh8QBwWPUGsYyC79cAqr6a96vdj8t/xvx43yvBRe1v137kKN82m/9iFrrYT8dDC2MGRReLHvY3b1qjOd3R2WAt0ZIVDD4b/GnVpV42ZZDmdznyDt63ag1W+inS+PfDfMC8Jib+Q0Pw82EKxw/wWMG088G5jn0D/EVyrNTxZQL6pA2HoajOQS5Ju8WS30S/LR2WWojyfzTVPWbxnosJP4E2N/7zURcsaCPp7dTCIQ9g2iEvm3Pqae1quuEhX2iFwMtJNiZpUkpDYyOoMZX5wE4ovWbWN5Qap3ZLSDRTuIMlHWs29O3/pv2rgoOufonsj/DfVe0tyXODnhlZCz2WQV5jq23DJPeTr8nO/Dcx/5gW4uH6MNmNA5Kcf52DYsQHSIGtSU9b1b8I8oG1SOo0u+9V9sLW/J4Ck+1iDqsa1HYbctbe54vW7J/Qo3yb+br2aVe/mDdOqhtLSjXAMoJ1U4fzRERfyvozPRQTapgg5Nia6jARyMx7GWQxTFT00FBr/k91FMeap7WLdUuWHeguSVvuY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf89b5c2-f3e3-43f9-112f-08dd88c20339
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:08:21.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqyXWM0jOfWAVaGAG7lcCUkuybZZ4aOvVEXmD1u3nJDsVtYZxOM/wsjrBcanPoJvNJB/wusW5ii+O/kTcQ5yx26XIV1uxqI4eWnfr7nFRXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010114
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=68138e69 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=uX6WMT0gYdChcd21BfoA:9 cc=ntf awl=host:13129
X-Proofpoint-ORIG-GUID: iLVfnPgWzeJCWhd9wSpPt5J2oGWglHQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExNCBTYWx0ZWRfXyH0//vE3VuGO qvJfbdqgUgN5cLp81y9fJYpZP7iM0ogYUEDc+nnhUuBgzc/hjwKkgb83IP3xlEAOxP79itwzi49 va1cnh+tZC5pC32m8eX/19a/MntLV7C+4NCue1e4DrsikDYNFzNNaDar2nFrK4WUVCIuJLUgnO2
 c6P8p6608m8cO4QCBTzBrUJNtPAoeNjgCxlEeYlY0Jk9bHjp3ZlBeSpwVWYIgCKswBkhmmUAG/u 2WddZb6dQUroj1vqapWe9AUTFgZp6OA7kyV5b1S1fGUfCOE5zaFG6bxsBeHib7vveLKh5NJVLL9 TUgTtNO5YBoZ4ptSddrvzFLuBT5BhsL2a+dbQvCBLRrATK4J11XfRIj49QhgHwN7Z8q8QX6D57h
 +h1QJoy2gSIFm1CCWBAXxPH162TbkfyqyWombDnJfLwc66CEtGiNwpOq2hUQv7CPh/+//kr8
X-Proofpoint-GUID: iLVfnPgWzeJCWhd9wSpPt5J2oGWglHQw

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_open.c    | 2 ++
 libdtrace/dt_version.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 51c056b2..0bda3504 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -42,6 +42,8 @@
 #include <dt_peb.h>
 #include <dt_pid.h>
 
+#include <dt_git_version.h>
+
 const dt_version_t _dtrace_versions[] = {
 	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */
 	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 3fd1b3d1..beef9a6f 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -13,7 +13,6 @@ extern "C" {
 #endif
 
 #include <dt_ident.h>
-#include <dt_git_version.h>
 
 /*
  * Stability definitions
-- 
2.42.0

