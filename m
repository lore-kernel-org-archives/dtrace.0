Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAEE2F0C55
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757778989; cv=fail; b=D7btJuRPPWGP/d/mGJ6SySE/73mO3ChMT77vSmBegRos2ROw229IsPLpUmrGbFld++yAZozan+3Xtj9ifL+axSNI7SjShqloBuOUG2SJlraMmzg6uOdLLNm4L6jt6s4Ks7L+sP93vTR9mdB44/1MmSN+ccBcEJzC/ZjHOGA1FAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757778989; c=relaxed/simple;
	bh=KUfN+0Yr+jlwwfSogXEIZXt5oxLs8UDH1KH2P425g9Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Bt4IwfPM4l4NDnuwk3ecjioiFREbBzRGuxqtEhOJGci89Ym/uXEheuwREkNutlrnoixAcBphyfNk6swjwTj5WedsQ75eqK3RwytPY+3PwyWvYuIEceFgWr5CTxPJxWDeYccj4hpjNOkXCizVHpc1fcyQgHGkQOgLB+DZPO2ox80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ng6HUMQw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FPZaUo1b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ng6HUMQw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FPZaUo1b"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58DCUTSY002020
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CgIDXnjWOa1t1T5tGw0O2mf0d1B7+Uwocf7qOvpVz18=; b=
	ng6HUMQwDhMs8cb1eFk4AsjxZY6foPxs59W9dQY2x3JJw9RLs6I0gqKgKp43hfvz
	vVQYQZLAEZKVEst8QAklvUHdGIs6fWjyy0QM6bWayK5r59KY7x79aUU9q9lV8JPS
	RDmmnaYLJChmqpUMMcTVagb9r9O/vcdLlOfP/jrM1ZxmCg/QcwhEeZPkEdHIlq0t
	7nizeaIix+rtYVtnXw0Mh+LaMqS0rWQmbszxuvjrQ6NjCPRKdjeA9YYkpeUl915B
	SmV9Tltwv+PjQODiU7YVNZMM258HvmP+kbnOpwCX0Ag8yXRUHaNbH2DuenwgRLy6
	wXk8vsk6uAag4JpMKOQ7jA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950gbgbrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58DBRSWS015517
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:25 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y29mgty-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVCmW4gcsFQWjYdHqlKU5ilACQGS8R2gcRrI8oMLpUlzkU7Dp8ocxPPLHDZFh8l0icymUTAPtB01FShKjymwTfF4ofRR3DHbT/2S8HAAO8gtQlAdMiR6LvHN5a3wwlfMXyj9Mi3C5J3YzK096tQVcQPLutPh5bQa4mczEwpGK4Qz6JBUCDFNG32HGzS1D1OVnUzOCvjoSslImiW/AazHDjjAOZtY8K2+o6Vf+n3v77YGinVE+aKV0M5orwORBDSbfOYeXadi10M8HrLKvcQBNnX6aopuNMCK3+NcseidVksIjsg4Z29irrtYTDybxx9g40Xo2db6KddGSVu2P8kcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgIDXnjWOa1t1T5tGw0O2mf0d1B7+Uwocf7qOvpVz18=;
 b=UDJr61klYb6yuzmoN+RKg9ztiYKghIybqeXNCid5xoI9ZjkJJ3gQTMf5GPV3nXV4aCPmKRf+Uk34SWxyQ+8SEsa/OdmztE/8OWuVWtVKtJs5TiPzsUre/jfPcNt5rKGaSHV0pIkT50COjgzoIifE2gkE0w70Ywkn1aM/DsMbQGv8SlF6C8iEXyQbK52XiuHD8CUBvGNUTp4/H9eAEKrVnbQUSJxwHRzyKpZTJTLKM9Ki/L96Dm8fbfitaJ3I53jMep6AL5ZjTyttH7SZLlNrdA+dxWQSfibKyLzuhI8BqUEmu2dNDfPwqgM2zZvdXE8bdKhP4sFad49MAoOcFnibiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgIDXnjWOa1t1T5tGw0O2mf0d1B7+Uwocf7qOvpVz18=;
 b=FPZaUo1bL+rht/lC5GG1xP6MHjJOcahNNyaWYaNPfR9h9eXSrBNVR8xsiUFYR1ZqY+OCjulKVwhVobHXKF7AJ6vx/DpfW6kUHD5emXJ3wn4QYNiEB46n9am9xSOiI4/7WVFzfoWrBmrJzHk5ekWmCq/8B/IROCN0wjtKIg0Y0wk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 15:56:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 15:56:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] Clean up unused argsz
Date: Sat, 13 Sep 2025 11:56:17 -0400
Message-Id: <20250913155619.22299-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6e892-9cf3-4d21-5487-08ddf2de15bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hTW9zu8AFqtTTY/B8CfPOEQFtILxCB8cjRQItxNQ6Sebs2Z+AbkB131u1SFG?=
 =?us-ascii?Q?Stz/mshVzQlqARtKugafS4iQ94riuv2qVFGC00Mmu13ridvdQz7cLA60G/ry?=
 =?us-ascii?Q?fOeCVllWiMOLkdsiOYLrG5jwPhccoj/OBqPd+rmF8V8XOPcLfVDLDvueGuLz?=
 =?us-ascii?Q?30Uhyh857IjjWD3v8yJhZf52njZ+hHRh/mlS92cgOyezgQjOeLiDXnlVfUyP?=
 =?us-ascii?Q?RwKEeRxRbFTI4ofTuyT7xbWrm/S5u7/sEBqSai9J9ljJe060jw4V14fF40HQ?=
 =?us-ascii?Q?+doHbHnpPhd34h8KQWZjVTZTdmhEn8in11k0i1b22d7+TJC4jucmftP7fPNJ?=
 =?us-ascii?Q?4GdNrUdRMbvSRH0Bj4rT06aCe2wQVcBl135Y+1gSfOWtNlWIl8dL15oyZD+B?=
 =?us-ascii?Q?AjLdiSmsswboSU1WSw6kiGS1U/cpAvgcGjMnquwwDG1CvbI0XhGiCeofO4ow?=
 =?us-ascii?Q?zzcKSMqTs/2xnOgNVmShKVTUeC2su5Fhb38I41H+48cfAgE/zh4aDXbc9JVJ?=
 =?us-ascii?Q?nJkEMuNTzf7VgzX6uggbbtsvfwLWwP9ChqhHLv0M/2qgiKL+Px9raP2UzkaG?=
 =?us-ascii?Q?yciqk01ig5OtuNQ2TDTPlJpmYGc4WFEBxlwp0270foszuXsldlw0uxiilldT?=
 =?us-ascii?Q?dEQ/PRYnk1fMheoVyXxgG52mhN3zB4ABqS5tkWgEdYisOHPcCZZui1Ll4CDw?=
 =?us-ascii?Q?wRZ7Ju4zlkI9U/lez0KsDV1NocwgyOVqgFrWBWLDaHGxdXzlMKGYE3MPgeA7?=
 =?us-ascii?Q?eJeh0tl4u7vwaRuUxIwGhRYZd6seC/+mnMbbaLAN8APeelqBNlbN30GkMuc0?=
 =?us-ascii?Q?lcGPM6aUHl409H3gXhD1+4mgcRDxztrpzpfXoWfYEqpCcWu5w48d9zcv6nWs?=
 =?us-ascii?Q?auC8Cblx5VLXQvNhQptjYfJu24kbB7otZksAQImUpZ8rScDI0pekhIMmh4lc?=
 =?us-ascii?Q?EsWTPAaT2kVtrPpPsmHicnCRdQ0HR2ZiMzDXQs9rNRJJqwf5okY3+2CYx401?=
 =?us-ascii?Q?ti258MBGk+b22JOC2pGBzDe2eAosNIatnyG2S5hB446UBSjKLxdNqqVvB4NJ?=
 =?us-ascii?Q?wOUGh00MOsBvS0Eq2PHhkxQH92dSfExfZ+tcmj9UEYNZ/uhKXVyQRfFvQa13?=
 =?us-ascii?Q?Ju1AbIeZ2o9+R79hJpcjOiAV19BnjfUp4LGOU9H8o0YyFs9yZTjRnPxPoCQg?=
 =?us-ascii?Q?5OQh28Cvw50DyKlrcoE/PcoUbTASOqH/K8AuPsTvfTtL3eKNfgKI3+/3V/l/?=
 =?us-ascii?Q?iHnEt+G4t8oG47P2jDgIidAevGjW+xiS89+YPK8XQ3ATFZN1XrRKR+FnM2j2?=
 =?us-ascii?Q?KVIjfpSt9ggb2w76yjUSg8HE4xsK4HLuuTdgHvgP/atOYeFDx+CwGGFi2VaU?=
 =?us-ascii?Q?tENzpGjBDc61RWACdxiT7R1BQTE3EbERf8mA+z5Q7iONEX+PxoVE8l7K3n4U?=
 =?us-ascii?Q?WhnzDyIfons=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EF72QnxRJeQulgn3PS//QIQJ5nLxx4ALK471be/ZWcocO1/OTvLGrQaR+DHa?=
 =?us-ascii?Q?n/oGaaAFHQzhT2pc35T3JLXKPYbFPkRGDNiPwbEojuo6u1iTvs57aS3pyAKv?=
 =?us-ascii?Q?tLcGFjXAcbpzKAM2DWHR/bFI/mLuMZ7Mkb3J5MgFzBxMtga95DiMxPyRem+A?=
 =?us-ascii?Q?KEymrn0a6EHgI388dCEXh40F2pAPpq+rZuSFncGhyAjSOQjuW68D+umJ256R?=
 =?us-ascii?Q?//39zIdb7p/Yi8pYaiGB4AqN7nJwHJ7uh9KYXFPGrQtU6Gbj04hISBtd3ZkB?=
 =?us-ascii?Q?DJvZxcGoYjseU1mUKQtzWRi0nsXIFm5xED8eEeS4Nq6IRVlJ5xQA5S5fNlfC?=
 =?us-ascii?Q?gIcNqYlO/z3LjFQu+gKZUTOPDk1NXz0RAQ7UNC6OTA/W1frDdkOBEj2cHY3z?=
 =?us-ascii?Q?3Jh0rSuqRWtNGo0dDi3276/9+QIlHQKJig0V1KNGtfbp7WpGJBt+gSB6UkTD?=
 =?us-ascii?Q?QnZ0Mg+zXduVT99g/38JNOD5/l1yAcE+9Vv63LDNy71oLcxpMBP1FM8fKgBF?=
 =?us-ascii?Q?GbtsyvalSb0KOo4EPwPdJAzB2rEkV7ojqZhnsAuz8n8SBXPwuI+EFy/OZ5L5?=
 =?us-ascii?Q?qdzkS4EMrfevrNpQeJemK7hAZQKXHkkwIqcFvufmJQTjP0beRfQYoKmE9+xj?=
 =?us-ascii?Q?WbWPkXIJt7SBJLr9uXp7/eH0x6cVqyrEc6Qh76ICbFAywDn0h9WgOUv99ecb?=
 =?us-ascii?Q?jhhBGZP63ooGA9HQCZd4EdowQlWZcQJH78UKiDttv+wt5qvAntz8ia6RqB8f?=
 =?us-ascii?Q?eqZgS9CjgTPgw7BacSo7ZODtdejVGl0dtdy29gv0BSB3cgqPh/PfhNMjBORv?=
 =?us-ascii?Q?aGABoz/5Mhc3cr4Qr2rXMuBpNNcUs/jdZLk1biiHriuXUYqS0cz6FfEO37dG?=
 =?us-ascii?Q?KFkOPo4uSZe6gPKpDanCjn7rwLU2nTds5p/hwLBRgmpyNeHsfgh0S0BMIHuM?=
 =?us-ascii?Q?js/QD7Aho5FVtUNI2b7ATzerkRlZFUeLkSmMkuOIPuUrFCIq+wULM557BSeb?=
 =?us-ascii?Q?M4B0O98YhQGfaKwkxEzX7K6GQpXoIUcnKB/TefWzCxcmQFo9Y93/2jEPw8bZ?=
 =?us-ascii?Q?/uheNpbHF04o4WyIORIbyqrblLE6+hjqEsWyEtEkkkBI1lxceNwDvL9F5yRH?=
 =?us-ascii?Q?05y5v03OPu0TiSkduOoTgkmtwz/6RdZT4NwX+kEByBIGx3KWTkviNJipYoyd?=
 =?us-ascii?Q?0TrMkR8sRJIlujRYLdVxBf8PfezqXg0L9WLGiqTQ3ZewwdkLU4gCUG9SCA+Y?=
 =?us-ascii?Q?Na544IWj5qsTVnrEUN3lTxe7bHNMKVoNHztW2/WnYsP6qIsHt8FnGP2cHSmi?=
 =?us-ascii?Q?QLqeSGluwiCbjEzajtl3s01uhH4Kq9H//fgfnJN1o2HZBCxciZiPOMkeuWlg?=
 =?us-ascii?Q?uBSuxSm1qrcuQpHZ85Q9Q1xFTYzbRGg1RxHRkmG9n9Jzveap724Tq4QqMgln?=
 =?us-ascii?Q?CYL+2yAdYZqKtLyTW0UqJ/lbAEp34+xvbu/5z92A9A7i2Z7YZnM28l9oZMoy?=
 =?us-ascii?Q?gwxhVg3ZZuCvBpl7Bp/pNz+6Jp5Db8HhQ9ZDcLUSX8RtANfiiCx6ZF/G4Au4?=
 =?us-ascii?Q?BICLjepmw9Lpop/yO0DNfXY48Isv+//lFf/yVFpE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dvzSWJepcTrWwfB2Tb8nIdtFq2OAKuMGW3jF1XRGe3SC+dNRmW4cCsgFLPMIywsJJSUqjGgc7tI+5gMTyGG1JuUs1SCaduccHPSmEIjXjjgCpQXfP/i+D9K5ancd5k55Z7OER5VH0h0YAYardSFfm/cyodnZ4WtDvgkbFPWwPzm3yILs+Sru4RJlYwxB1a+yIzBrHaFMTLhhd///Z2jU+Nxn7SQzTOHnzk8BlSfd7o1A415fazX5xIScqWZZVFOW0NEgwCSpQbCaSYQV5NwkqLyoBdJFkjYmJ6cKikzUsWMG1LmgbmMqQ/OMG0VClbpdIortNOg48L0+lO2Nf3rg0Fs2EuhTOYaJxMoeYtCKZxu+qfuh/lDWk3FBYQSTvPlJ4rvDLZ6F1WX82dm3q/8VMMjuyFNWzGXkFJ59+n404TzIXC4cFIspb/z+8YXMQf4UVuLw8o6ui0kcWdp1ilNa2ZM7pKOme+hZDk/Y0mR0UYs+ETAPKOYzd/luHlWVh2tg722YK3JffkOup04HFczZgQYfsHc731/xQtXCeoRCU5uzh3WTsWatvAy7EID3Mkj4HiA0PcPQaf3YxN/n/vszDBI9JhoKSP0paf1/ob4ijg4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6e892-9cf3-4d21-5487-08ddf2de15bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:56:21.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zewN8eA9lnwVgp387JjGIER74otTKB3RJr9WjNSoZI4nYhJx8gNEZUt0XPXvRpu7G9+Gxm2moPJ/qrvsoUXB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509130152
X-Proofpoint-GUID: 7uPbQ_BAftSbUUWJuXPMoj7oza3klRky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNyBTYWx0ZWRfX8fw0F/lsTy+1
 jwIgAj+1Rd4pCxtJXG/UnKYrEBRbS+zZKC7jtVu3fsoEzBl1F9Ll9lCTt27InNszZ5fVJ4qXk/K
 NMgQLqua9FUZIEabvNLKmjSPq6tcJ7BCKiw55aoOvwvVYVMMufd0Bu/H1LdeaJaWYMrTYeVFzFm
 xTFBpm2tmoYb8hcnwENDnwlfJwKwV9fKKS24M80zhJGAuy3p+NOZX2tVqSBNYVNFuM9tsTBBbWv
 eWpnbtEsikFolTexjMH3aeCvsgzSOmCEcGOnbqpXwMERRF3A9qI1GmidW/jCibZRHsa46EvKB9Y
 ZdhlOeqJwgGHNJFGPl1FeauQ5yORsczRV6PAYB0/aJzBYfzsW0dJTBTvIoonOwgEExOdBQjaj5n
 yoNFosJXfuJSoGyzxF5KeUaTI2qy2g==
X-Authority-Analysis: v=2.4 cv=QIloRhLL c=1 sm=1 tr=0 ts=68c5942a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=u6icPx2XTUCWz6G_FqYA:9 cc=ntf
 awl=host:12084
X-Proofpoint-ORIG-GUID: 7uPbQ_BAftSbUUWJuXPMoj7oza3klRky

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider_tp.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 4531a88a8..33821f2c7 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -141,7 +141,6 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	char		*buf = NULL;
 	size_t		bufsz;
 	int		argc;
-	size_t		argsz = 0;
 	dt_argdesc_t	*argv = NULL;
 
 	tpp->id = 0;
@@ -153,8 +152,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 
 	/*
 	 * Pass 1:
-	 * Determine the event id and the number of arguments (along with the
-	 * total size of all type strings together).
+	 * Determine the event id and the number of arguments.
 	 */
 	argc = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
@@ -170,12 +168,6 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 		/* We found a field: description - see if we should skip it. */
 		if (argc++ < 0)
 			continue;
-
-		/*
-		 * We over-estimate the space needed (pass 2 will strip off the
-		 * identifier name).
-		 */
-		argsz += strlen(p) + 1;
 	}
 	free(buf);
 	buf = NULL;
-- 
2.47.3

