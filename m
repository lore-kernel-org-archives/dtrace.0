Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223C817
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281517; cv=fail; b=GZjW2qC7BPP7HqyzlwFRiTcwpbeqsZcmCHvUnw3PvrYjlaav/3t32btroRbobNclReJnfnM/nzu22dFM8coObIXzy4XxWKDAp+qrCgoiiDnMSXu7ptF1Iv8o+F06i/Kia5UAqNbe/yvWehrK/dYcOlAjaTvc3VPNeVVa0jeiJ4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281517; c=relaxed/simple;
	bh=vCZyptadUfEz/Kv3JCFcgFuBu2QzcqAZF8nWm5CEjW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZoeI4VyxfBjawyDhavB3SJjkm3yCTvfOkItylEszN2dx3X+GGLq7rmpgqQev1J5WeGre+rvdWKboGqYdYm0kN1T8og5QtvF6D7MKljX/hEovmBv1W4kRgAV/HqG8ZybTLS+YJ2y1LkLTvYJ5wYMLETFajni3u2UcsNYh+MSMCAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VXbrDRHi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Mc0bpSON; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VXbrDRHi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mc0bpSON"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfhvq023515
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=VlF+pTzDtG3zxyT9GnBAkRUWe/nCOuXGCEslBt217Ro=; b=
	VXbrDRHikyRrU6sEpiT7SfNw0PdAqGTgWAj/uV4AGWg/EAJ9EiJjB4BV6I+fvE2w
	ErjX4zYv4J+rod8GcIcTtTMZiBUcpFyO0BgT8pWQPJZTp26SP3J+oK7h64Sefd9b
	EXvJmt8oG5Pjo88xcNW8nfI5SCUQQ/IOSC0o2C1ESoCMQwHwhxiJ8wDxpvuojMgi
	xezkUQ7SOMIRwQCa3lSGsqOpGd3l1ZFT//yjUEmLV2jftJ80SleiGb2PaitGipII
	L1bOR+9QpTRyHS1gXmnOfRlu/kovDZei+CHVRVOPbDF2tNsMacqH3n6TUQvpmBLm
	Kb4r8lD8qagjS0Tg/71ArQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5ct3wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49II9fYs027250
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjmuyc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQtdIW/zdMvgAZJAVph7gkhRBPxjKc3FMmfheel+4rFklZUzRY6fbrlMZ+xVAEypMmv6KBGj/6lVRfwkZUEhnIXOIFwAkt1fiN6lUYpo4rAGcskT6DcsYOyFUeyhtHqAscqFGiM5ahUd7Ih+jJnNkftE/6ABdp/eX7pFjMTNo5Etc+V3E3WpMmDJPopkw0N6sHKEuqj7kNptOLC1DVi4flQ+tQID/8MNYizLq03o8pmK2/IODtuOPuIPOL3eFE83QqdzhBbodi6teixQEGyemuGG1V0Che7CeThhxFkm3SbDGVRTH/tZ8JdL3DSL/81+KNmAW/46wBIWIvFYfn8BCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlF+pTzDtG3zxyT9GnBAkRUWe/nCOuXGCEslBt217Ro=;
 b=PXNtQuPc1aWHoS7dkw9/i/De0eRIw4+v11iCM22PslMJDm9qwWnmPPV8cDBueInFbeyYOMaiYnLxra+HVJgOJfqVOw+BSgreLJAuerEYTRXKeTjMJpbRbPMYIHSy/RzXJVajgiPI0vpYH/haPmCEwXT3/BBfkvwUHosRqXAubAvIw1ljYqOh39cd17lS9j9NfFhCxPCzuUMtkUqWN4OFrjrpXCgUMRbtc3ZwA5SO6L7BkZMgvlCctMQR3oDa5fXJ1MgrtWRVu9XcInAvdgd7aH5TpJPY06K7RO/h/H8cv4riGQNzTjlE2JZvN6JtzZSG8j9tzkz4lDhJD9Tx2hMmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlF+pTzDtG3zxyT9GnBAkRUWe/nCOuXGCEslBt217Ro=;
 b=Mc0bpSON2nbImYgu/NR0lvGGZgg429u3heLyZRUOauz5z+MTPlMRJF7S3Np6Fj2vTaJCxQDe44vCH0UOcdjJC5K5hIyfZ8w0T9s2BPGNhONkgXd39Ems7gtZZLQWcZtgjlObVxWLcPXh1DrIqkR+s2ekNzqzpgffY6IYjQGTUG4=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:30 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] cg: add argument remapping in the trampoline
Date: Fri, 18 Oct 2024 20:58:06 +0100
Message-ID: <20241018195808.270688-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0146.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::7) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f20dcf-8272-4038-8d49-08dcefaf3d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ktGSz/WVcF4L3epbOomN80ZOhmV4e/yUEWm+NHD7nAtcFKe/eGEMtvkAdBn7?=
 =?us-ascii?Q?bbR8YKfojHR78L/c/tF6foWssMGvFN7RB4fPcVvvwxdG6bFKVKyonGGp/Yao?=
 =?us-ascii?Q?Xt/OTeFZ2iHBfIgUujZSru8tADmrGIBoxBIEHWc7+pAzCZE/1sDrMiSxPMo0?=
 =?us-ascii?Q?tu9gbui7L0Y7xmcEXAksc6S4Wr6axYEl/FBjl7fAf9ELPqYhLqLsE01cgCKL?=
 =?us-ascii?Q?Zu4WVcpzYKC2j1OFyRKSnQlyAbfE1IGJOHz/zhqvaOVjMGGED6/tBCRcZIxW?=
 =?us-ascii?Q?+suVI83bNey7+gQi82PqJ00BqSrLwmzqEG9KkzZeWVvSUTEXvlbuIA89cl+M?=
 =?us-ascii?Q?Ij4DgPt0g7ANHwhv7uLh3eOM7sR3h6D/gFl3Rqw9J5gitRGxYxmR8hfGfFR4?=
 =?us-ascii?Q?KFIb86w/BPEf4+F5JgIe57ozHBVJJOWJBTJGVOmAV0G+siVSBjd8DdoV3+uR?=
 =?us-ascii?Q?tvPUrKh4LQMedlum8ccFOeyPdNcUo8Bdx7Y17XWNJemlzw/1Ec1I2du/oAg2?=
 =?us-ascii?Q?6eFYk/v7OflmNpLqfy7YiS2n5k3OdSH2zIYxGvM3GFjR93Wk+3PuyGUhaQNJ?=
 =?us-ascii?Q?7odqn0oHjP+haD238JMWcvHrMjArI/oMjUBAMKodce0latm5IajbaUGuxNr3?=
 =?us-ascii?Q?RtVTWsUe0hV1PbQ86/L7TUeU6IL2gBRXiG+tfQvw6KeQlyPEx29G8AI61T4M?=
 =?us-ascii?Q?jHllYjGKuZgEn3fhuYb62aRwn3/ToYh+4zr+xhaBt+yASSepmfEdSNvQr7g3?=
 =?us-ascii?Q?g/jiPj7n1v/7UlQLUd70w1SN1FWzE7iMrGEEujkjYQNNRWLSXaJfDjifOqz0?=
 =?us-ascii?Q?HQk/phWy9ilM9EMPN9XHQNX8sWFhaRCZeiDhBGUmZxNEo8eVmURU7mKwwShu?=
 =?us-ascii?Q?FldMlKbnBhhptCKR/NcHy4f08Zq79S2bmTkAV67UxjEBmEWF6eVjfGt8HMns?=
 =?us-ascii?Q?aX+ntAIFXRizh17l+qWUv/6PjjJchhTlMpa9EVfb9hZ+iHJq9N0H9u57GlDa?=
 =?us-ascii?Q?yrzWPFMTY2M9PVDbvRHZ0qfA02ruQND+8RL0k6ke9PPXnYCphed2LW/Jdafi?=
 =?us-ascii?Q?BuiPwGYxbnb2N8lLC2uNCWE2V65M/PiLZebh5TJ846SDhnkI1Psr/my5n+ve?=
 =?us-ascii?Q?WyUXfhbGstdeEhq9fcM561rPvw5IhLVumSxTFGE4nnxQ1Ftp/16PbhgsUtDX?=
 =?us-ascii?Q?n4qevk+BVCzPTu1WcFYVdDZr6JlM1Ui/r8B4iLLNtTkf+4XCYq3sRou5SfXA?=
 =?us-ascii?Q?k2DFG49q7am8V8Ba21Y9ohGtDCv7SntEeAgyk5f37jW4LxlUrCVxWNpfeTg/?=
 =?us-ascii?Q?joEpZ5I/zPLv0U0ZsXJkwpVv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JCF6caBEBXhYM0lypU+c68QZXQOA+WUJCkPKUVnbSkx3CjdTVfZ6CnUxOFXt?=
 =?us-ascii?Q?y6nb+ABW2roGhhbouQk+wnMyWX3BmmupBQCfkFPXe6KGrRJu93WG0Egzwt3s?=
 =?us-ascii?Q?iQR5Wz/uwzOQ0ig12oHoUPIBA0LBLrOwu5ANpeOJrrPIPd6jr4EnsIC+RRAp?=
 =?us-ascii?Q?AhJ+FEqeFZCfe11zopR5jg54irt3+Fk0f7KKuEZ54KrzDdrMJYyJRAGEDe34?=
 =?us-ascii?Q?uMaptA5eIdhFOiPNKcr0ZV5TpnyWkTq814PTrMO9mSSBXjWPW00gdPWKV/Ok?=
 =?us-ascii?Q?dY/lj/qSrU+HJSqHBXzlTfQ3XN5SvDbcUE37mok/cmBy0C6JZrPRBW2NP6+N?=
 =?us-ascii?Q?0tPvVS9cbJYmVHdyVYtrYgv7uPYd/oeeueckAhjA3wQAHV3QeIz6lWX6Zkdr?=
 =?us-ascii?Q?XGvuTmA/F862CrPjZqKWXrQu1qdvuEMyPcYHr8d11Ed9BEyQsN5GiEz2kn4N?=
 =?us-ascii?Q?e26GbNsntwpMWJKTMp/kSLvJPKmbbqp9pwgqodba47aEBv8dyQPoT2KiX33L?=
 =?us-ascii?Q?ZSosKCZvm/KI+p6HU5RYCQkytwDlIrmAjVD/FwBNw54GReKTWnVXIESpG6Ru?=
 =?us-ascii?Q?gQmTe3+lpnuB8jcZCSEr38u6983jHUGZIYxzEiKw7IchB0tRIJRS7MjDvUAf?=
 =?us-ascii?Q?hDCYapAKPzOppcDzlvKGx/1E4zpwLBIC6aQxwQ2CgLamejd4f5SyFp6CKcgY?=
 =?us-ascii?Q?H75yMGw0jfqkmAFytvT1haYBvo1RQFAC0LSXpLuT2GaH36QThlG3FSM3UbW1?=
 =?us-ascii?Q?3W+aMLlbSO6C74PM4iKui9acacnCMqkkXhFZVl+6IuM+B3zKjLztSbY3uY8U?=
 =?us-ascii?Q?fdGWl6PQ+33WshBdO5QNIjxujmLh+eel6RQQP8dCd6JWNDYuFpXfzQLHPVcg?=
 =?us-ascii?Q?91W0RLXAqnU9nsy/e2kep/u7xfoENiwu3FFMXmwdnlH09RMKhlDDD8cw7QAv?=
 =?us-ascii?Q?6799mBR1LTKxgX7qgypDlk2xVhUfZF5a2F2UCg4sBw3yyWd8eP1dJntZ12aL?=
 =?us-ascii?Q?SKME+6/0tAmDMAZAOhgOnk2JfjUyxULO3ZX+f33DzVRTygUQ1w3c3D6Rnc3G?=
 =?us-ascii?Q?Grj6+koRG0XPkQCtkEFklomYhji9qBx9BHcg9Z/MfCij0V8H4d7S8Mjv/iBL?=
 =?us-ascii?Q?U1opSsiyTSyqjUromNsshNB8o29V5eJzA0AL4lndQ25rmMOx/C2sr1D9ooIM?=
 =?us-ascii?Q?fkdF7uzcFY5Zl642MCveJjadauITvzykkT6G9Pf6hYGvuAAFBROgKkq84+X8?=
 =?us-ascii?Q?9RnjeY0kl+C1XdcfkPIIoLn0bC6xAT7zswQ7I8MJblg++VuL9+9iWl1xjeCv?=
 =?us-ascii?Q?ppdi7NaP0XiOlfQfsa1FayiD6JrTlv5pBU60dgWlLj2c/4lvsEgr6npxLOJE?=
 =?us-ascii?Q?4Ys4pPrI5PoIdPDm+ieBztnpizrkfzxAKn3w/1DbGaFtthNkqbNZO5k60B56?=
 =?us-ascii?Q?IZV6LGzPvvFj5BNm+0kkdQ4O5EAEqMv9mW16hqTBEBcgdv4ebjGImAD+xRFa?=
 =?us-ascii?Q?bfRZ1doZY/Y8rQe6dU3YVgtn6GNV9y9XafEVawFSE5jIDZg4l4seRNpjpgp2?=
 =?us-ascii?Q?mLUsJ7hTA3dle7Ay1H3BNP6OHpygE0hCHP0KxTJtRYQayrkV0ERKE1S24NjV?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/7oanD/DT3P8Guh5cfVhzJ2JkRmAVC5IP6WRs53qHnxU9GLnWkMJiJhlpeOsk0PJqtPXa/cq1J1cllf+iBTdwKIsCY+ux9ypEVxaHdPvGhdzEoqHiOWP3xPHwW9aAIVhre0lflDMu8Hn9L1njLcAk+GRgr+AJNDMzjMSrR/YgHo1WFtFZR2E7AOKTR2w97ayLoqtjp2TnE9DPB4kXBocv8FaVfnqB0xzkGreArmnUYD0YcX8ef1aC1qiWdw14hMih49TyPreN7nhLxq+CPAkFIs4k7VqEn0jKXlKPW8g0udtaJVRDjFqtOKiG4g+bWosuWxwD4Wf6DRdTflhKnv7kFdYsJNhSD19/CxBG1bDkSMKSNvNjfWVDM0N/d3lPGSntanCTTkvkQE4taG7FYrMRcd6aYqOb7YYTPnQ7hplB0jsq6w5sXcFMtHwXcTgE4u0QETU9ApspNRGSWuY4yIzsnyxWBQh3RbxDe+YH04RldQIN8ykzY5CjPFHkWS9hg46fzi9U5N7SnDM+DxlvGT7q5nuTjOC7Xlu112c1el9XNPENguUW4SL9vTfFEebyMFpNxFGPTai7QMLoq4ISE3K4a1Yw2ONuGc6P3N1YaepeG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f20dcf-8272-4038-8d49-08dcefaf3d0c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:30.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMDeUaCI5xGJ0A3MvZiWJbDySGxleObA7MU4cZ7iVbUjilXppnQRK9mcYGANv7AaGhsgwF+PvHOa+mtIgOdwCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180127
X-Proofpoint-ORIG-GUID: xjpH_LjDeM6fAiqPTtraAwX0mLvNx0Ev
X-Proofpoint-GUID: xjpH_LjDeM6fAiqPTtraAwX0mLvNx0Ev

Before now, argument remapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that remapping is also applied to argN
for USDT, and it would definitely be more *convenient* if it were (so that
argN and arg[N] always contain the same content, and only their types
differ).  Add a new function dt_cg_tramp_remap_args(), which can be
called from trampolines to apply remappings (destructively, but it keeps a
copy of the old args in the save area so you can unapply them if you need
to).  No existing providers do any remapping, so this is not yet called, but
it's about to be.

The remapping info is still propagated up out of per-provider state so that
the parser can use it to tell what types the remapped arguments are and
to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
the probe remapping to 1:1 and shuffle the native types correspondingly,
to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
moved the native types around).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 35 ++++++++++++++++++++++++++++++++++-
 libdtrace/dt_cg.h |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..9709667d97fb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,34 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Remap arguments according to the array of remappings given.  The original
+ * arguments are overwritten (but saved).
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_remap_args(dt_pcb_t *pcb, uint8_t *remappings, size_t nremappings)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	/*
+	 * Work from saved args so we don't need to worry about overwriting regs
+	 * we're about to remap.
+	 */
+	dt_cg_tramp_save_args(pcb);
+
+	for (i = 0; i < nremappings; i++) {
+		if (remappings[i] != i) {
+			dt_dprintf("Remap: loading from %i, storing to %i\n", remappings[i], i);
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5060,7 +5088,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * array index according to the static argument mapping (if any),
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
-	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If dt_cg_tramp_remap_args is in use, you should apply the remapping
+	 * at the probe_info stage, since the effective "native" arg positions
+	 * will be changed.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..4c6d0f5dac6a 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_remap_args(dt_pcb_t *pcb, uint8_t *remappings, size_t nremappings);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

