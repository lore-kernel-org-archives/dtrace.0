Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0012B9BF
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112107; cv=fail; b=RBloQcLf7rcWbfpyRje2/qM5R6Guo8UGwZysw7TgSy3NMPS565pATWCU+Agg8PBBLmyNr5b26ZcU+eXfAGeklI6ZC95boIXzWxtYz9z0y6O1jGWfN0gtLJlD6Wmm2sH0/vU3ViHXJkLyEUAgXqf+ogKEMaGtNecIDWdIJu/H7Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112107; c=relaxed/simple;
	bh=wdv3vQvGNL+1gKxnwg0HX4/KZSHTrgT7rRwlNkK/Voc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ZmXfGzo2dW/ebun1cORt35DFIb7dfiwgwPpsoQyqyqboUeQOEg14rHXDhvpU70pZny3RGXQHL2IFfGKFmp2Stuhmxm/LCqXhbR7SyTB00zurw8JqDwE9yQE3Vsjs6JY/L+OpqNKtu2lz5n+F+JseWdWHL7DzTIOCE7uXw6hHD9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SuMq8189; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pIM4O+V5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SuMq8189";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pIM4O+V5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Ett7F000381
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4tTBUBFAYgfputxnBM4MfOlYXPpho52NDX02CPylUv4=; b=
	SuMq8189hckpH2LojE+lV3kuNV8H19SlenvaluCIoGV/sYSjKv133dV98uMuTYAS
	jArk68Xyl8QMrb1jSMymKxIRymOpJmHwWSJgmFQ2ubECkleIHYcOCemLfv+PB5pS
	qLfbrCqA4OtB7gAzkSN/AjhilYSl2Hj+O+fHiZMETD66Be0wZVAq5Hs7tAFHeZZN
	Z34EAXkQ+1vuiGlt5D4ghJvGCO5FAxjS0s4E/x1RVoR54f2pUmoRcX47Jfs6xRK7
	fZFR0IbNdaDqSxkDqzqba5kTn/VoQ3Os6ZyTgB38VglkGbq1HTRoNBSsimBwZqJo
	YHF106l2/Jqd0PGzqhaONw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6umb5nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541D0e0Z011408
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:23 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010003.outbound.protection.outlook.com [40.93.10.3])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd54we-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlDYvVH3mmIoFFz+gnC0O+N5FgvfkaNAeiA2XecuAjShZyYjSfMaaaVK1z5ImBvA7wzBPsSle5QCQdhHCiOA7XLhlF0AJHkSPnEN0kaMGWcdjHbXFQQfdzcCeLNZzfA/NbUyMkGVg4y6tmHgToYknIRhQ4xm1wlq5VA8HbgAIJK7P3cDRg92tMR2KT9W3jzRBUIEgD8f4zqU8IMw1xZzJ/81PBxydKmvkUsFV0hKFDN+Fo51kVfJTJ/k0IA6LoS6s/WjhZQ7uR8CbG2/yi1Ux81bxYGN9XvmpJ3IUp4CHhxdAczzZ9X3WRzwF5tiYVCNrSav4lLcJ8NBhKtSr6tO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tTBUBFAYgfputxnBM4MfOlYXPpho52NDX02CPylUv4=;
 b=HclZCQ/craAP4Xi+KgiSeqQE/xS2KdK3GWn++fxxRW0cqMFNp7jj+tQiGINnbQiy39Sh1tJ+/jZ+HfS4IiOvSPogJKa2uTatyZubyBQ7Ho+FHz/nEGww8SYEjCSF93uUoOu8fK4sENAlT+ji+h3glGNeNtT2yfgu+NzTqxHUHdv77l/jeXjdZov6Z2RCkIOF9dMRQyxDgUoPFbOiHyHYTaIBzmQxKPS0P9AVC94jng0WpfzNeP0prUA6uH9D0iCT6pyXuV2pATh70MY80bF7I7xt7IxCbaTceKy4A2wIgmflyjRl+T5ZLo38lf5R/e4vn2/JmvdTED4A+g6C/QFsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tTBUBFAYgfputxnBM4MfOlYXPpho52NDX02CPylUv4=;
 b=pIM4O+V5Ka12rZ8M3PjoL+p0b82tnqcKxk6AOp0vk5zzpJMGww7XvD3+e3LmNjdQhlzgJINH55IgBvxvE20ymQ1wMXYpSbwSHhCeAsdl6Udl5mn0jiH1boqgMAGUUligkGqj3g3vC0i72BNWntpR9yH7Epm+uvoxxivBdlQCRew=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by CYXPR10MB7922.namprd10.prod.outlook.com
 (2603:10b6:930:de::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 15:08:19 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:08:19 +0000
Date: Thu, 01 May 2025 11:08:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] providers: loop through all providers for discovery
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Message-ID:
 <SJ5PPF7F7BBD994C343BCACE248CFE59A36C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|CYXPR10MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: ba913f15-1d55-48af-773a-08dd88c20202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gjv61bNZ5TDBwNUsyCH8H8on06wT06lNSRLNVGKzfcpp6NuLv7ZYb4yd29sE?=
 =?us-ascii?Q?wQDBeTiuWSpEc1aN60g/dmzr70hFClkrHm666A6BUaQVBdaIDRMCtaNRC3mm?=
 =?us-ascii?Q?uk6BTxUD+FhlzTs5OkykbcISRwe4VLhY303JQ+zoyy05q7Gh/nhafSk3I2lX?=
 =?us-ascii?Q?ZQ+lRiT1QUYHb1vx+yBOWUEmShtBaEsLtUa4ykqLN66miW/4tLhUksvvuO4o?=
 =?us-ascii?Q?Hlf/h5WkWJVCGjN34ZFv+H3L4AqFEI7P/vwp3fO+zqN7wzaOiAAqn/jQ7tam?=
 =?us-ascii?Q?QwS27ukg1pAb2WhEsEBghJ+3PoQZ/YiCdypUYVPEfrzJpyJogikil6RdWjA2?=
 =?us-ascii?Q?OhstNaOJS9D7DI+mpdZxygARfAKaf1A0dBY62i7vDJ3ixHrrKjSpcqYFSedF?=
 =?us-ascii?Q?IehHetwRdeH9Sl0922woWxBXuX3veGj9lTzoiPaeoKFRVrC2E6yIQlvfslbz?=
 =?us-ascii?Q?0D++0iABfCY9pgj1os330Sb+rrXbqeIaPZTyX8kDWIuQ7XHS41pcyB7x1/pw?=
 =?us-ascii?Q?ZoOpFOIdSVjB0PljVkGWbe5pGP1ZGVSOqGvrfzWvPsbRggY1P8ElbbznPKik?=
 =?us-ascii?Q?RpZw0C7zUQXXjtt/yfKpsIlgrF5Q5MV6zZhDtjwLaaXzopqfyVKem5HaIkgb?=
 =?us-ascii?Q?Bbu7pqk+EFwbvfhq6iAVEk5s6Fx0AUnhDKsDCOe6bjb4QbYzTwGOTOlRrFI/?=
 =?us-ascii?Q?l7gUdj2dZv2PYKs17gBfsiK9Fldt8k/ECnoqksn31rxq4jRxVb/k6SUOCml8?=
 =?us-ascii?Q?ZwPgtSK5BP87S7O+cid0jrdFpWjbTSrW7KFgN5NUxSaVx2hMsr0EakquyrfC?=
 =?us-ascii?Q?SJtDq50LlOfDMC6618yst68fC09gtbdCJgATb4gnkIGUzHImmNYEHF8Bhpo+?=
 =?us-ascii?Q?cqkpfB14mopQIRFjfYgyYqS5N8Ftiq+hAo9QGwQ84BTDxtggxyMQ5ShtK6N3?=
 =?us-ascii?Q?bJz3v5+cARHjas1ElIGQDVYwZJsbizqR9mxisI5QflrJQwLiDXY8QA3vGRzI?=
 =?us-ascii?Q?1lX9KmejvbDMN3TdrPXqAGtlFHftAPSJII0E+SGLWF8z9KcPh8ZASOY2S64o?=
 =?us-ascii?Q?ucelk/aPD03MrYgBUsVacFUA4/AztgU6v7IgmH0pIFGfDaOf0ioTsxv1GmDI?=
 =?us-ascii?Q?fcXxr29AGAss0+t+ZgwEu4l0nLW6tGjhYLRb38Wc/n/sTWBbSKKpC3/dwGD/?=
 =?us-ascii?Q?ZXwkCb3hUH6wlfeYpAF/WmxShIWeYArpxvxyn4OLkfnOMJ/OlC6S0ljlxwxC?=
 =?us-ascii?Q?nWFcebj+J6/ZAED7EuwxQrhFEWWLsb4TIWkI7hvJlg857ZldxdbAcs/hLm2I?=
 =?us-ascii?Q?XBthKMAWu6cs7sfrQcl6xkFb5VItUxvKHn8bN1pmrkxJLKUC4jNRMrNOehcs?=
 =?us-ascii?Q?ZekMnxOWljJ3Bn47uFshjbdrVRbc2g4jJDrfPodOiDRJXRuJZhmuUQOQ4XUT?=
 =?us-ascii?Q?kSlv3m0JStc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GmMu+4gFGoaBa86pPneba0/HVyDqR+voNFA58wWtv+EeTgm9hjYBGhgS9V+j?=
 =?us-ascii?Q?9FdIGlB1kVYOy1BAkslPbwqSDIvpK5Mhv58MVxklrgDFJL7fD6UN7EL/1aQ4?=
 =?us-ascii?Q?OGjSLYQQISTzCieAq1+r3bbtBgXA1RbZ2Ckas8uMplrJsXFV9B/9iUEuRJhC?=
 =?us-ascii?Q?uiR6+l5VhCL/5OryZ1dEUYorDGvaIiU7apA6f0IjUwwnn+qhDT/2AOK8LL0v?=
 =?us-ascii?Q?xNNYt7I/1DKna54zbmUO61AGy3G2URojDtw9XID6yYfXUp74sl4ulQKjVDtU?=
 =?us-ascii?Q?eN7KcKkfLsRc8s6YbUocG2YUacScpO/iOkN5GrkhnC2GQpaa2teyqDxAd6AK?=
 =?us-ascii?Q?4tyANze/URuyZ2S7sR4D1oZ/FweqsF+Qduwcv7Ge3URvIKh5jYs2KqioRzeq?=
 =?us-ascii?Q?vYAX1DB1KEo+XiIRCaa/12x38TdSJxvhED3mUVCde4QFwShii3l3zatD+Jrl?=
 =?us-ascii?Q?PCCQHn2Bnz6qbki08QLLLahGBIUDrKCfS0qZZrVbzZlo9wbBQ24iNxQYgbe9?=
 =?us-ascii?Q?pe1sEgccqSxLGyc/iE37zOEGJlATneIw6xhO9rjG13TCKZiVs1dfaW2stjyH?=
 =?us-ascii?Q?S2j28i5gAvZV8ohZkVflJLUEuZsndvMVRM23lqPoqkj3MHxp7COj0dUB2Eqw?=
 =?us-ascii?Q?eRRJB9IfIhO0vVD/Zqm5pwrMaim9W+ou3MglU8ixyR7AxD9TQFOW10e8DuKx?=
 =?us-ascii?Q?/n93ie53UCkkI4PdHJrWi1p6kK2siGhz6rkSTevpuk4RnncOFHTSK8y51tqr?=
 =?us-ascii?Q?EbrtEemFk6eluJoExXdaVvs6VmDiNfXBWazDKQE2EEPZJBIWJqPJ+2KfJ9vS?=
 =?us-ascii?Q?tdNNRmYN9Ee5a5WnpJqU7Mh72LaJNT6VG26iugtu9+b46kE75b+HcGYrFL8+?=
 =?us-ascii?Q?8g5hSzU+n176rZLkeUHx/ZY2SpanahvQ8xchEY3QNavrgTJeuxfP7VrrIIbj?=
 =?us-ascii?Q?xHACaMS/zjAVwqxYvA+7KUgK3zeiGtRVtJ2ws/S/cl4d7YzTlTdHpxfxFfG9?=
 =?us-ascii?Q?iAoM3OT//RiniLWN7Z8giee+t24znw/xQvfeFvG8V3io8r+HZKqTpOTlE6Eu?=
 =?us-ascii?Q?MEzfG//+G3ncHHRbC2FyoN1GrOiQ2Lwuvf8AIWRQwS2lqpTpsZ7PlDRzL7QL?=
 =?us-ascii?Q?GI9ShGQBObW+FE4FU6WBjryp3feEIuNUk0nwLTg76uEtji4bQ8oB3mJwJubP?=
 =?us-ascii?Q?y5jLtYsn4pH/0rhZzNNAFNCdIKcfUd8YLTk/SJCvmGhxU0msp3e4qW+Zkl4b?=
 =?us-ascii?Q?MqTfcQSpykR0vnSArB5FZbv1QVor8M80HLTO7fIjgBDhWq3yBcx4G+Oej3u3?=
 =?us-ascii?Q?Xi3QmlpWT3NoUFiRU6nEb/rYL5jOsGCHKrIpg+arOXzCjo3a4ygMd0Cq923p?=
 =?us-ascii?Q?4psANKQ8JzIO/PamRo/+rhiNhGcLftrw7tfgJ3CUZfjcD3YKj8Z6Spgt8d2a?=
 =?us-ascii?Q?5FJceM1ZqR6zHqPqVbKzxNnkp6Yegfj5hTuWgegAsWKlc10pxkuiL52SXvoZ?=
 =?us-ascii?Q?7blqJdwAhObNots6vVVwKiIcGWkYiNf8Lafpj4BP1r5k6Ne90Oi44Pc19sQw?=
 =?us-ascii?Q?GvDqldq+A9EmRqpN9T6AWXA7PEn+29OPkNTvk559ce8zmZGvJs8GfhYyjsTV?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	anV2NfDuLPXTFthXBFsefzL2DCQN8VsIm768wH7aqHgfQD1bLy7JKsh3NFdwOlzjNWik80c/v+xn/1NXyU4hHsxQ0Q5LDCx4ygbNhC35U/ldlAqnUYGO0/Iq55XpfaUuZXE4T2PTaIbJGNkjMGbzz/U0mk2Vkdo8QKZln/IecD8eC4tt7XY0NlELIlmYthr6Fy+rn6O+8D51ppM23RavBfLGxUiB+pWOUykempZ9qJFfO4K9KYEGCKLd9AduMtfkvaAC71TN+RpIJSWDCuZN3ymJpEeueTki3wGx0qjglDjcvJ5pdYQC+M2yMSV7iLak/qzXyC9Imael4ODCO2B6ahvc4xYczs1ncqgGRRjE+K2ZBE7s4rg9sNYWBHuLRXRA6y+Zt8aoyMMBWUuyU/M0ceIbyy8g2Yk9/62Nce4fonBgb051HE2aHdjQYjsAo1OL5UejvUopJTWfomJ+rFaia6djqj1OVnnwJgUMwvUtY1cMoe1IhS80zdBxfMiAflID9QXenz6vNuakpXfXUrq3A2YpA0iPX9lEL8iAE7sKNPTiR2e8uhUp0MCYuSLjr2V0wY4reO4zfyerNFrcD7CY1uecUeLdVuXl2Sl5mtEX/xY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba913f15-1d55-48af-773a-08dd88c20202
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:08:19.6505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kM6a9/K1LSgPk1ReF+V/VZKH9KI5Bru6JzHzFxZi0DfOzXgZ/vV14c7iHc5D248arjKhmu3bLCyC4v2q1ohINCg2KgpR60fgNylILdxOfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7922
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010114
X-Authority-Analysis: v=2.4 cv=dfSA3WXe c=1 sm=1 tr=0 ts=68138e68 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PeFa0sTlZfMI_3LvvQEA:9
X-Proofpoint-GUID: OKJm5dH0IO62KCUHMAYS1ekUpd8pZMFB
X-Proofpoint-ORIG-GUID: OKJm5dH0IO62KCUHMAYS1ekUpd8pZMFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExNCBTYWx0ZWRfX4fpVIn0Imucx 1Zu8UHQMnftl9JNLgU/yJLhpmHXHmcRuDhqn2z1EeBTM4R0jasx7VITnsyMgCor7CoxNPXW72JF KC8RE3Lw2OnPcoGDTNncECt/oTciO7618+SENpXnGk4MPRY4Oy8TLfG98kr/eG5tJuhweEJ7sJf
 xdsHmYRXeRkId5Tra+Yj5VAM33RMPVRy4jUymWY3eYjegaLg4AWjpvVC3MpSc3dbn+U6Y7PGMWW zeUv9IvE+AOtXd76OLQnVk25WTQRFz9O2BR4dFPYBHCkrySJ7FkcYk0Ij3AGG6J1KIbXjyAawyw +ywHW1Ov1Odg/ywjX0l2kZzVNAyfbVMBz8hIjlTCwwwIodpw5bjZLqSueTORd3tUnoy6UbAyOyC
 jUH9/DaAmnsyA14+oSqkntuZk+fedFzry+2rDfySQpr8/Mworcb2vr5EMK+MxsgDC/U+Duiw

The discovery of probes was tied to the static list of providers that
are called on init.  It should iterate over all providers that are in
fact registered, i.e. the dt_provs hash.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_provider.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 1e2e844e..06f0b039 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -176,11 +176,13 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 int
 dt_provider_discover(dtrace_hdl_t *dtp)
 {
-	int i, prid = dtp->dt_probe_id;
+	int		prid = dtp->dt_probe_id;
+	dt_htab_next_t	*it = NULL;
+	dt_provider_t	*pvp;
 
 	/* Discover new probes. */
-	for (i = 0; dt_providers[i]; i++) {
-		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
+		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
 			return -1;        /* errno is already set */
 	}
 
-- 
2.42.0

