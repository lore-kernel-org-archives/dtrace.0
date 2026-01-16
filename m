Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A981C3BF7
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603661; cv=fail; b=pb+Gx6A12Yq8t3BeE/YagvcS8PzKvLLNGvTY0GxfjLLkljw7+LstJHCa0ZeIvvevEW1MevwjU8qjGuE8e/Qr7K5pDa7l/YwDDCk0sGzlYQy/j7aqjTUCXbprZflViZBWX6C2US2eEawsSf/1TTlMYryQzGjYuhvctZrisD6Vfx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603661; c=relaxed/simple;
	bh=GVhJbZhPaWOAD8S9L14n/zh7Uch46DEO0EEZQKQCRk0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=GiWD9xKtcKPcys+OEc1t9JqDL5nhaONMsYCG+NJdJlr78r36yPp9Gc0W34HLiFl0bTxleDIB4prcohXrpgqckVP7nHZhiLSBNjpsCiE/yLVDvZ+xXJ+T2nmvEyaykP3aKpyRvY5fz7tOo5NwqQmxBOOq6ai7lsBfHaikf+56c20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S6x7gBFv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pfSase0J; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S6x7gBFv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pfSase0J"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbOXN4013346
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=/DNCWNaGvsy/wu0TCW2GbeOWU5Lr3wzcTcdx6qPVEZ8=; b=
	S6x7gBFvfgL1N3NIg14OITp24xPzkBkTM0vZPBo0ncmYWzFlCVsoUKxQLszYQTCY
	wPZH+SwW3DTzd7ngRi7DytJNpbVNdH4YQ9jTAGcwRvLn32ofvIBzO9C/sgh6A/Ls
	AhRKn7na5dOq8/moxMo0osEyUxf5TcsqmKxm2EAzUg++8gMTl2Ce4mVYf+wbbIVS
	L652aWILQW60Tqfrvh6elD+wUa+m9XGP7APYhcTMdBV49tfSZxE30NkPIMwZw5b6
	wLaF+jRRpIvwB99fO7LdFV53qQ/k7dtM5KpnmSbT1/1Fz+8ZBuKEMIOwGCFfrYXf
	oJPeIkXf9/qLKmBI+MKovA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvhe84t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:47:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKKrMp011428
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:47:36 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv9m44ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1YfpmoTw5cBjUpG9W6db65UiD3s7bTjbFhyKrnotEhmY20LDc6hkp3mVPA211E3PXNwjjVwRlc2BUHAADuCHGK1nunI9Fw6LXHDxTstQMiO9iQB6Ku14eFMzoq/RMzasJtHS2/Hx4mcg5HzNHHxKNOCfrv4n4u1U4CVTEgxU0MuOCz+I8t/5iAQ7CBLfZ5B94OyyRZOczl7xPC2MgOUSlgs/T2VOc2CpGWVGF9tfinfeTPMnynUZTaEvhIqqra2acnCNQgWKIX6khmXXrgj66GlUoRF6TnFtgzoT9K01NT4EJRSZZQFW9npYxAfX5uvw8GymTGbboRxSd9Mo5RlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DNCWNaGvsy/wu0TCW2GbeOWU5Lr3wzcTcdx6qPVEZ8=;
 b=KScPtgyBAFpz8hMA9WGWJGMU7XnmL6yJiWKSfN2nXK4gMttzDzFdMb3dVcOUI9lpfCp/RIgFUGWDTw+hDOhVR08y0Rud1UvLS2P9xRxLkrJIs7Yt10+LFm6A5Qjz06FK8aCQ33z2j2aGGmcaz14nRakfOJTKyPbHhPhrz9u1jWgkplduyLTzAukiwAViBBZs1Ed1KBPI+oNg4vaeyOtOCSlKZmmxZf/PdwdWbvs9U69LGozYGoHodWXQ2MI0bDHssk2Nz1R+84SauMBAYs/t9optYNhCTbk5T2W1QMVKDhryho6YN4djOqy0igNXpuLlQgtdADTA9We9wrmDG8ib5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DNCWNaGvsy/wu0TCW2GbeOWU5Lr3wzcTcdx6qPVEZ8=;
 b=pfSase0JmZj+Z1CIQvl3myYkxxsr7PUH6Om9OhTxDoYOjZEnHu9UWvQpEOvwaBrdzQkly7EepGrxwpePqJAI7IGgrv32IOAbyYXc757Ttdf4aJQMumjg3OmCKVeEWgwdavu1iPfZe0PzjxuxG9kkXFTtlBY1RY8N91TO/kAFsA0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BN0PR10MB4840.namprd10.prod.outlook.com (2603:10b6:408:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 22:47:33 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:47:32 +0000
Date: Fri, 16 Jan 2026 17:47:31 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: [PATCH] spec: various fixes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752287C32D26FEB3EF6F32F8C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BN0PR10MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ecdd5c-f1c2-47f2-13c7-08de55513c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6dp1J1nmAIgz1p+4H9nCHgWWEkqYcx6d6s3uSihheazjXHaCIFoApD9G+TxA?=
 =?us-ascii?Q?c0OGw1y0AThhzgLOXp7plKNZ9xBOI+krDagyVkbCbfJ4m2QW1VvqF90Yr+4N?=
 =?us-ascii?Q?N1Qt9Z2lERsUcZNZ6uL/Yk6hYiOBZTpNtseHN/wfG5PUBNR1M4KLaQp9vY89?=
 =?us-ascii?Q?+UPwp4oURE2dOFvW9GqLC+/iBfO72AX3DFwZfDKcOGgETeU1jZqvXw90bkuC?=
 =?us-ascii?Q?xBWRHmH2X+/65IMPwUG69eteY0qhRB0ggj2RRThj+eRAHaV2G1bfzsc8Lxui?=
 =?us-ascii?Q?ouOZvvVKupuu3Jg4KkB71EIhJL1CcTwEiOP8vXUqPaDrdXxSUZWOIb6T3CG1?=
 =?us-ascii?Q?aR11O0sNgbUC1VCeVr9PUodiiOCP/RiXX8Iwxru31MO4e7GNI9IyMSiIeRcG?=
 =?us-ascii?Q?C7UGTJCQcyUtY6ZNrHFEWOZBl1+kgN5rXtv9vBiCkHTpr+6pb85ku9KGMFpn?=
 =?us-ascii?Q?J1Jlt1YiIHkPVIUS0qEcsTaqbdljAUG0tFpKutPIWDyOXr4u8hkpiZCvLuqP?=
 =?us-ascii?Q?FA4KLf9GacQJRP8QG/pGLpC9MSl1B0fPbsCf12686CrgXOVNAjxxtvggExLG?=
 =?us-ascii?Q?OBzI52MC1Z3brzg1oKtqrUfmgvksfVTJP7j8WBIdFBAH8toZv170Q/5Aj/4O?=
 =?us-ascii?Q?D6Zv5T2Jmv6WKQzaZqMU/avBCJ5GZgg9U2T/KFJ++0NiFX5gjAvpB1CI1oI0?=
 =?us-ascii?Q?2xpLwc2vF30ge7Y3HvPEQp/wyDc/nbAW+vv1GVDGUQxR6lCj/yJIBnM4hNWK?=
 =?us-ascii?Q?YtrErOmX+IHl8aFkH/KcxLvHhp3iLCV3RcngL5UK+OlQEwOluy7/BV3lz2Tn?=
 =?us-ascii?Q?ivQiOF4AwAzFK5srGoLNPq3K4cyCpGAcO7+3PQidC8x8TYt9Z6GnR0n2uG3L?=
 =?us-ascii?Q?qxFSzdGydZJ9mUmyBvZk9kFe//pL64eU2sI1qM6mBpqOLsWBv4lfgIZ87bCX?=
 =?us-ascii?Q?FFIJUPcMNH8kmD8CYm9w8c6Pwmi7YiojI9MhgRU3cP4lhf9H4UYLXiCKesBt?=
 =?us-ascii?Q?grsNwtme6lAI3u4IOBDV+jdIQr/vp0kT2SNZ4zwCsxRqKWBAXyiHQMlYh63R?=
 =?us-ascii?Q?bA0LHdTAL7Ra/BQzIcy4qe+6wYs27D3k7O/d5PXKWavWe0Y73R42PW+JLXP0?=
 =?us-ascii?Q?/YcN+9DBXuwfHWl/TwjtVyh8rhaWj9oYmdM7/euTfEXU/EZM9NjX89RWNNMy?=
 =?us-ascii?Q?5MhcrDTGG6q+HFawS+IYoEgMXEji9U1Pq6eSl/qAPs8S9xr+MKuP0g+DqVT2?=
 =?us-ascii?Q?qIILGN7airZrDumDF5/1jyoJzzAs2eAYs17+e8Xy0wo7yht3tHQODQQtJwU2?=
 =?us-ascii?Q?Op4K0cLcQiD7kJsS11g/RC68+pcRG6PwelFOMaC/99XU75r30P6aLS1HubUS?=
 =?us-ascii?Q?CANc/pCJJNXbRCPvWRVeAoTSjqaGoGKWjN4mtdF6x+c1ogczqL4Bcv1AECcr?=
 =?us-ascii?Q?TtFPb1zgAMv6x//2NbtYMvLyxcoQvnhOhRO3YmAYfgvPwiYNvcelDRQGU6Au?=
 =?us-ascii?Q?6XKw/zO7OP2U0RJ9fVy0nYypOmXXdR7xU6chpbC8NixS3sjFjr7zHDNMkIw0?=
 =?us-ascii?Q?ESPMda1Lkj38r/0acdE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wY3p/cB7XIIO8evMFiwjWYVZvMaVjohkQXg0Ce3dedzguI8t7u78X2xwYjvM?=
 =?us-ascii?Q?sKc9y9ZaZezrqMv+4l+T7ZcyWcfsV21wgfbgQVruja1m4aU3yw2WuJWoKKc6?=
 =?us-ascii?Q?Vgfvt3pvKJEza8H/ZnqFrPhd+dOwLuzinpw4JoqBUNd2pdik1DYDPbXOxhEz?=
 =?us-ascii?Q?GR18XiHCLHSZE1+zVU8Jbk/9Bg8YeumYb+9Gm8qDENOFxApTjzO7uQGhuVPc?=
 =?us-ascii?Q?4bPWNw3yCMdQ6/7aTJqTowPn+NgTYgBtDAcHjk+/Olo2rC88fBU0l53eIRLj?=
 =?us-ascii?Q?aoyjrKObG2x395nbgUR0Nom6X7K8CwYPxAQQ3RpCR8ui+B0kJpmrp2donbn0?=
 =?us-ascii?Q?UTfAF5MFJkkGdaUVRkCi2goefNe59AEfrL/PKo/9NOYd03Tmb1ht5XKFWx4o?=
 =?us-ascii?Q?6lBGnR4us0ki9FRrgQ8ooslgGHUAbCtMK09slz75KKQl5K+ztfVOnfbZ4iZQ?=
 =?us-ascii?Q?u2YFn65CNQa+/4Z8H35lJtywiCIalg8UMh3KWO3e+M917TxVx/F2yFljOGi0?=
 =?us-ascii?Q?tQ7FPA10Uz/FXDkM2eZDLU5ShnjwDtyr9D4tp19Kc179atuDX45SVUf3BJGh?=
 =?us-ascii?Q?ch7SRordgdtVYL8Rjod5jWYmX6/YnDq6NMOB9JGZmUIe/ud0prUwk2Ri/cVD?=
 =?us-ascii?Q?rPa29ufoZp+lnu52A+ypD7l2dEoL4O1nMkQlAzv8zW838Q9bdQSabEaeK0YN?=
 =?us-ascii?Q?SDuVyjNLmDtTGdv5QZJ+TZSMtOZv5OaNjKdzndsIzQ1iSRGor+Ha2Qs+iP8s?=
 =?us-ascii?Q?i1AqNcz4hGbv5oUNLpcV2rvQaRqf49S+l32mLtEmgzQOKauXjof2NgnPgXma?=
 =?us-ascii?Q?uBwRFFVovS9tFAMpfehjFnb2azyo0FOBeAFYRb20PQIEMVwn+zLp7eEzShc3?=
 =?us-ascii?Q?Pug4tHMJq83k8jGDF0OWhMrPwbIPGnMM/aEvvPARrAhW7aBGnuN96C6qM61J?=
 =?us-ascii?Q?kUf0KvL8eDvMmMyk410epxJSaz+KWqSDHAVVL4st2oegSki55aCqjVhuqQ3y?=
 =?us-ascii?Q?1auRuiPPTt2dYQV2Kdj2FkS1ORDRiNSIYQWj1zxOFr3/QA5667iCgn0JUuso?=
 =?us-ascii?Q?chDnZ7PsQ7VNGmPIyMU37w65mK2ba9PlrHWcvbLeZ2oW1tDziZD5kBFC1Auf?=
 =?us-ascii?Q?NylVZE2eq9jYH+qmm9Wi/jYLSqZVR1bHVNgJbj6j4VUIIz48gt+GkrB4PjC7?=
 =?us-ascii?Q?T8lSc/9AFEoTMNRqKEh7ofhdt7VjFZ4D3IhxN3qkcdjm6+tMPOJiw5/o1B1X?=
 =?us-ascii?Q?h4ghkOVQ2Y0JOrDGfQpzS2LGuY0FyQw0DnsARLLoE+RssRfnc+LqLqR4FF58?=
 =?us-ascii?Q?Cbs1ZeOp36QK9Ut0OSEAjxDiostJzOMvcZ3NWQ1rWfLw/eABJWOyqJpnoOm4?=
 =?us-ascii?Q?TBiNyjQrUX4axTMhosYzHuKre+DAsnLO+rESTpmLQ/N8nXEWs/EXz18ilGpV?=
 =?us-ascii?Q?6R52sGflezUNHTyIgQ0+/lltZZ4u9kCNsfPsygEK1qGIrw3LjuUIztq8qbFj?=
 =?us-ascii?Q?ucDCcq65oavmIK2rLWx47khyz4wpHy4d8NTU6brVfDt+y2soR517Dh6n56Lo?=
 =?us-ascii?Q?MZ7y9qp1EZ6b8MwxE9IXzvcP6aRVHpbeaJ7P2K6+OXdKWpfVopaZmVyEOpcM?=
 =?us-ascii?Q?P8DNk6KnD3+thHwvN33SyCtdP3nZLX9g/RlREeSc8XWKGdNsLpxRAraDQRoe?=
 =?us-ascii?Q?jViLfYtW6C1/yLuCzSSqLDXUVdf0A/YMe2VqhYXLJSi+WG/jUJeKAoMmC1cm?=
 =?us-ascii?Q?pI0juUty2NWNvbAkPNBJgwOVfCGdINg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+EFyVwLUzU6XaoigI/sa8GcJdM5WlKAIWUSgQOJtVdCMpKCAD7rr4kpWdzwA+chMFjffzdpm2oQsRb6QA9PQFEmeQa91xgfdGruEF2UMPO/VMh737hhRPDsAIdo8V8uv9/YC8vLq+vtAJqqk9iGZ21RJTKGUzj4FvaP8QBeXgsDGK1HO88OZYvnks7F72QnhT9nooctK/1Ntblvz7KtWGaQ9PtmlkJ9gr2REUIyc8vv7j9HEsf/HFbp3+fHELKKJ4Jwa+pM6sSVy9SxIFcQ0SnqFXZFfjMAaFKARJRTifnURB89neGk7UyuQ3y2YtmFFhCXJNFhU4hedpVAfEcCP5NyM5WMN6DQZHgV3m6GT4xNB2V2+ctamJnFMildjNfapdmdQKNdac3lXBfNgS+ssr7xRZVlqJZdeJaSWdrEb1KMwxEtih0jmUum+V/McpJPZPDvpRkd08l9aQd2D3uo+nhPwmV54qCZHAC300u+ZXNDjYCsqZNUKX6tR8vxY2sIQjSZ4RW1Uq20wM3rrZAKhRblVZKMIh+UHQcBiLilKobay29Z4htDnM5tIlcIrv42ZxS60rA8649SypNt2xlXPTycCLTj5bzf0USQPVGfV4Ms=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ecdd5c-f1c2-47f2-13c7-08de55513c48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:47:32.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU/awnzYvbJ2x/DE3AWWNnW2BcxvLfMPDzL+lZd0wSLsKOTr4JUj2/yqYN72QFtOPXmuGrPEhNhskP82FcEWV/cYeYhXbTrwF5fj/z7NHLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160171
X-Proofpoint-GUID: 6Mg0bIZCuUH1EyE_9TNJA6UANBNswmSe
X-Proofpoint-ORIG-GUID: 6Mg0bIZCuUH1EyE_9TNJA6UANBNswmSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3MSBTYWx0ZWRfX0lIKr1b9Dnx0
 8EX0EAHYTkRuNFpFuNIlEAwLddN0JJ7FWjwNhDWi2V4BXB4jm1l9zuy6fGQLKaakdmMDqlvxCHL
 pkq54l2u+RNdsbcHpWavGtrrR5SGPZ8ud9ZhVhdisUSo3tqrfu82f+MWmIy8jv8cSux9XA6/w58
 +CSRjAMvXgWYZGPip2xVvuLtODC6H5fTkoBTopxuG8xyN1Pqv++ck0KOACTR+1VN5cEIkjiLXR7
 /OxI8CSG2kbXpbcxg9nyXkqSqOGOR9TRNozLraRcH40SQfhixMikgwD724XjSshQnDXl5d8L16u
 1z60CTM79GORdVC6527jm6/4FOfNhVtN3LVjdIm8pxec20fxsZqWw7JsXM/2Bnm3pZGg316ybnn
 tUJHymqlwLhdInJDXGZ4k9p3tu7YPnHiBbP9s2FCNkndzl+txjM2VFm1rvWH2XvUGYqJBhv7Pw9
 /MLJ1Ho9ZI7eE+4jEMA==
X-Authority-Analysis: v=2.4 cv=Aa+83nXG c=1 sm=1 tr=0 ts=696ac009 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=kdkA_eQeIBE42ZgfAtEA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 96 ++++++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 4b20dc40..d8c3e9b3 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -588,7 +588,7 @@ systemctl start dtprobed || :
 * Tue Jul 30 2019 Kris van Hees <kris.van.hees@oracle.com> - 2.0.0-0.1
 - DTrace implementation based on BPF (initial portions).
 
-* Fri Aug 10 2018 - <nick.alcock@oracle.com> - 1.1.0-0.1
+* Fri Aug 10 2018 Nick Alcock <nick.alcock@oracle.com> - 1.1.0-0.1
 - Add more DTRACE_PROBE definitions to sdt.h, for SystemTap
   compatibility, and test them (Tomas Jedlicka) [Orabug: 27721525]
 - Fix disassembler coredump (Tomas Jedlicka) [Orabug: 28054399]
@@ -615,19 +615,19 @@ systemctl start dtprobed || :
   [Orabug: 28142056]
 - Clean up compiler warnings (Eugene Loh) [Orabug: 27934422, 27998779]
 
-* Thu May 10 2018 - <nick.alcock@oracle.com> - 1.0.2-1
+* Thu May 10 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.2-1
 - Testsuite fixes [Orabug: 27995907]
 
-* Fri Apr 27 2018 - <nick.alcock@oracle.com> - 1.0.1-1
+* Fri Apr 27 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.1-1
 - ARM64 USDT and pid probe support (Kris Van Hees) [Orabug: 27847969]
 - Fix -c option on ARM64 (Kris Van Hees) [Orabug: 27847946]
 - Disable pid provider tests on UEK4.
 - Testsuite fixes [Orabug: 27921244, 27919918]
 
-* Thu Mar 29 2018 - <tomas.jedlicka@oracle.com> - 1.0.0-10
+* Thu Mar 29 2018 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 1.0.0-10
 - Enabled tst.default.d in smoketests.
 
-* Tue Mar 27 2018 - <tomas.jedlicka@oracle.com> - 1.0.0-9
+* Tue Mar 27 2018 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 1.0.0-9
 - Updated translators to match new kernel redesign of per-task and
   per-process data. [Orabug: 27731759]
 - Enhanced build system to support multiple kernels [Orabug: 27731756]
@@ -635,7 +635,7 @@ systemctl start dtprobed || :
 - Adjusted the interpretation of /proc/kallmodsyms for aarch64
   (Eugene Loh) [Orabug: 27214992]
 
-* Thu Mar  8 2018 - <nick.alcock@oracle.com> - 1.0.0-8
+* Thu Mar  8 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-8
 - Change dtrace_proc_*() public interfaces to take a struct dtrace_proc,
   avoiding lifecycle issues that can cause access to freed memory when
   victims are exec()ing rapidly [Orabug: 27501199]
@@ -651,37 +651,37 @@ systemctl start dtprobed || :
 - Consider erratically failing tests in some directories to be passes
 - Test fixes [Orabug: 27583002, 27651838]
 
-* Fri Feb 16 2018 - <nick.alcock@oracle.com> - 1.0.0-7
+* Fri Feb 16 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-7
 - Internal development release.
 - Several latent porting bugs fixed (Kris Van Hees)
 - Make tests used in smoke testsuite rely on sdt less
   (Kris Van Hees)
 
-* Tue Jan 30 2018 - <nick.alcock@oracle.com> - 1.0.0-6
+* Tue Jan 30 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-6
 - Internal development release.
 - ARM64 support [Orabug: 27438960, 27438993, 27438977]
 - Include correct procfs.h (Tomas Jedlicka) [Orabug: 27266725]
 
-* Thu Jan 18 2018 - <nick.alcock@oracle.com> - 1.0.0-5
+* Thu Jan 18 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-5
 - Internal development release.
 - Bring back translators for 4.14.
 
-* Fri Jan 12 2018 - <nick.alcock@oracle.com> - 1.0.0-4
+* Fri Jan 12 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-4
 - Internal development release.
 - Eliminate new symbol at address 0 on KPTI-enabled kernels
   [Orabug: 27364377]
 - Boost some test timeouts
 
-* Fri Jan  5 2018 - <nick.alcock@oracle.com> - 1.0.0-3
+* Fri Jan  5 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-3
 - Internal development release.
 - New tests and test fixes (Kris Van Hees, Nicolas Droux)
   [Orabug: 27194352, 27282243]
 
-* Fri Dec 15 2017 - <nick.alcock@oracle.com> - 1.0.0-2
+* Fri Dec 15 2017 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-2
 - Internal development release.
 - Fix rare assertion failures at exit [Orabug: 26848964]
 
-* Thu Nov 30 2017 - <nick.alcock@oracle.com> - 1.0.0-1
+* Thu Nov 30 2017 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-1
 - Release for smoketesters, not GA
 - Fix mod() normalization: add test for it (Tomas Jedlicka, Eugene Loh)
   [Orabug: 26826564]
@@ -698,16 +698,16 @@ systemctl start dtprobed || :
 - New tests for the lockstat provider and fixes to jstack and 3-arg
   tracemem tests (Eugene Loh, Alan Maguire) [Orabug: 26149894, 27015838]
 
-* Mon Oct 16 2017 - <nick.alcock@oracle.com> - 0.6.2-3
+* Mon Oct 16 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-3
 - Apply correct version of lockstat patch [Orabug: 26149894]
 
-* Mon Oct 16 2017 - <nick.alcock@oracle.com> - 0.6.2-2
+* Mon Oct 16 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-2
 - Add lockstat provider [Orabug: 26149894] (Alan Maguire)
 - Add missing obsolete of dtrace-modules-provider-headers (Tomas Jedlicka)
   [Orabug: 26883486]
 - Add missing testsuite NFS dependency (Tomas Jedlicka) [Orabug: 26860985]
 
-* Thu Sep 21 2017 - <nick.alcock@oracle.com> - 0.6.2-1
+* Thu Sep 21 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-1
 - Internal development release.
 - Fix segfault at shutdown time if grabbed processes die at
   precisely the wrong time [Orabug: 26528776]
@@ -727,14 +727,14 @@ systemctl start dtprobed || :
 - Testsuite fixes and new tests for inet_*() and lquantize
   (Eugene Loh, Alan Maguire, Nick Alcock)
 
-* Wed Sep 13 2017 - <nick.alcock@oracle.com> - 0.6.1-3
+* Wed Sep 13 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.1-3
 - Relicense all of userspace, including the testsuite, to UPL.
 - Merge NEWS from the modules into NEWS for userspace: there is
   only one NEWS now.
 - Test fixes (Tomas Jedlicka, Nick Alcock) [Orabug: 26522961]
 - make check-quick support, skipping long-running tests
 
-* Fri Jul 14 2017 - <tomas.jedlicka@oracle.com> - 0.6.1-2
+* Fri Jul 14 2017 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 0.6.1-2
 - Internal development release
 - Fix name of lowest bucket in dtrace_print_lquantize() (Eugene Loh)
   [Orabug: 26261502]
@@ -754,7 +754,7 @@ systemctl start dtprobed || :
 - dtrace-utils-testsuite now depends on dtrace-devel.
   (Nick Alcock) [Orabug: 26415697]
 
-* Thu May 25 2017 - <nick.alcock@oracle.com> - 0.6.1-1
+* Thu May 25 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.1-1
 - Add translators and tests for TCP and UDP (Alan Maguire)
   [Orabug: 25815242]
 - Add translators for the IO provider (Nicolas Droux) [Orabug: 25816562]
@@ -764,15 +764,15 @@ systemctl start dtprobed || :
 - Repeated dtrace -G no longer corrupts the object file (Kris Van Hees)
   [Orabug: 22509887]
 
-* Tue Mar 21 2017 - <nick.alcock@oracle.com> - 0.6.0-3
+* Tue Mar 21 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-3
 - Test fixes
 
-* Fri Mar  3 2017 - <nick.alcock@oracle.com> - 0.6.0-2
+* Fri Mar  3 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-2
 - Internal development release
 - Add translator for ip provider [Orabug: 25557249]
 - Test fixes and new tests.
 
-* Tue Jan 17 2017 - <nick.alcock@oracle.com> - 0.6.0-1
+* Tue Jan 17 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-1
 - Internal development release
 - Allow self-grabs [Orabug: 24829169]
 - Use /proc/pid/map_files if available [Orabug: 24843582]
@@ -780,22 +780,22 @@ systemctl start dtprobed || :
 - Add improved multi-argument DTRACE_PROBE macro [Orabug: 24678905]
 - Fix infloops in SPARC breakpoint handling [Orabug: 24454127]
 
-* Tue Nov  8 2016 - <nick.alcock@oracle.com> - 0.5.4-1
+* Tue Nov  8 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.4-1
 - Work around elfutils bug causing object file corruption [Orabug: 25059329]
 
-* Wed Jul 20 2016 - <nick.alcock@oracle.com> - 0.5.3-2
+* Wed Jul 20 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.3-2
 - New tests
 
-* Thu Apr 28 2016 - <nick.alcock@oracle.com> - 0.5.3-1
+* Thu Apr 28 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.3-1
 - Prevent intermittent assertion failures crashes and hangs when
   shutdown races with termination of a grabbed process [Orabug: 22824594]
   [Orabug: 23028026]
 
-* Fri Feb  5 2016 - <nick.alcock@oracle.com> - 0.5.2-2
+* Fri Feb  5 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.2-2
 - Fix uregs array on SPARC [Orabug: 22602756]
 - Testsuite fixes
 
-* Tue Jan 12 2016 - <nick.alcock@oracle.com> - 0.5.2-1
+* Tue Jan 12 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.2-1
 - Do not crash USDT probe users when shared libraries are in the upper half of
   the address space [Orabug: 22384028]
 - Do not waste CPU time busywaiting in a do-nothing ioctl()-heavy loop
@@ -805,39 +805,39 @@ systemctl start dtprobed || :
   [Orabug: 22390414]
 - Fix smoketests on SPARC [Orabug: 22533468]
 
-* Tue Dec  8 2015 - <nick.alcock@oracle.com> - 0.5.1-4
+* Tue Dec  8 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-4
 - Internal development release.
 - Prevent testsuite hangs when per-arch options are in use [Orabug: 22030161]
 
-* Thu Nov 19 2015 - <nick.alcock@oracle.com> - 0.5.1-3
+* Thu Nov 19 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-3
 - Fix buggy performance improvements to correctly detect out-of-tree modules
   (like dtrace.ko) and speed them up some more [Orabug: 22237449]
   [Orabug: 22238204]
 
-* Wed Nov 18 2015 - <nick.alcock@oracle.com> - 0.5.1-2
+* Wed Nov 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-2
 - Internal development release.
 - Remove typoed non-bug from rpm changelog.
 
-* Wed Nov 18 2015 - <nick.alcock@oracle.com> - 0.5.1-1
+* Wed Nov 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-1
 - Internal development release.
 - Improve startup performance when disk cache is cold [Orabug: 22185787]
   [Orabug: 22185763] [Orabug: 22083846]
 - Fix various problems in the testsuite and in DTRACE_DEBUG output
   [Orabug: 21431540] [Orabug: 22170799]
 
-* Wed Nov  4 2015 - <nick.alcock@oracle.com> - 0.5.0-4
+* Wed Nov  4 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-4
 - Improve identification of system daemons that must not be ptraced
   unless explicitly specified [Orabug: 21914902]
 - Improve symbol resolution in the absence of ptrace() [Orabug: 22106441]
 - Fix dtrace -p with an invalid PID [Orabug: 21974221]
 - Close any inherited fds before running testsuite [Orabug: 21914934]
 
-* Wed Sep 23 2015 - <nick.alcock@oracle.com> - 0.5.0-3
+* Wed Sep 23 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-3
 - Internal development release
 - No longer reference UEK3 kernels on SPARC.
 - Do not require 32-bit glibc on SPARC.
 
-* Wed Sep  9 2015 - <nick.alcock@oracle.com> - 0.5.0-2
+* Wed Sep  9 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-2
 - Internal development release
 - No longer Provide: an unversioned dtrace-utils [Orabug: 21622263]
 - Add missing testsuite package deps [Orabug: 21663841] [Orabug: 21753123]
@@ -845,29 +845,29 @@ systemctl start dtprobed || :
 - Test logfiles should not be affected by the verbosity of the test run
   [Orabug: 21769905]
 
-* Wed Aug 12 2015 - <nick.alcock@oracle.com> - 0.5.0-1
+* Wed Aug 12 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-1
 - Internal development release
 - SPARC64 support. [Orabug: 19005071]
 - Translator support for 4.1 kernel.
 
-* Tue Jun 30 2015 - <nick.alcock@oracle.com> - 0.4.6-4
+* Tue Jun 30 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-4
 - Add DTrace release and SCM version info via dtrace -Vv [Orabug: 21351062]
 - Add source-tree-independent testsuite RPM (not distributed)
 - Fix the testsuite module-loading pre-checks to actually work
   [Orabug: 21344988]
 - Various build system fixes
 
-* Tue Jun 23 2015 - <nick.alcock@oracle.com> - 0.4.6-3
+* Tue Jun 23 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-3
 - Internal development release
 - Fix deadlocks and failures to latch processes for symbol lookup caused
   by failure to correctly track their state over time, in 0.4.6-1+ only.
 
-* Mon Jun 22 2015 - <nick.alcock@oracle.com> - 0.4.6-2
+* Mon Jun 22 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-2
 - Internal development release
 - Fix a rare race causing stalls of fork()ed children of traced processes
   under load, in 0.4.6-1 only [Orabug: 21284447]
 
-* Thu Jun 18 2015 - <nick.alcock@oracle.com> - 0.4.6-1
+* Thu Jun 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-1
 - Internal development release
 - Support multiple kernels with a single userspace tree, loading system
   D libraries from directories named like /usr/lib64/dtrace/3.8.
@@ -882,14 +882,14 @@ systemctl start dtprobed || :
   being monitored is unchanged since it was last inspected. [Orabug: 21279300]
 - Properly remove breakpoints from fork()ed children. [Orabug: 21279300]
 
-* Mon Feb 16 2015 - <nick.alcock@oracle.com> - 0.4.5-3
+* Mon Feb 16 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-3
 - The dependencies are adjusted to pick up the renamed dtrace headers package.
   [Orabug: 20508087]
 
-* Tue Nov 18 2014 - <nick.alcock@oracle.com> - 0.4.5-2
+* Tue Nov 18 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-2
 - A number of crashes when out of memory are fixed. [Orabug: 20014606]
 
-* Thu Oct 23 2014 - <nick.alcock@oracle.com> - 0.4.5-1
+* Thu Oct 23 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-1
 - Automatically load provider modules from /etc/dtrace-modules, if present
   [Orabug: 19821254]
 - Fix intermittent crash on failure of initial grabs or creations of processes
@@ -903,15 +903,15 @@ systemctl start dtprobed || :
   [Orabug: 19882050]
 - Fix DIF subr names in dtrace -S output [Orabug: 19881997]
 
-* Tue Jul 22 2014 - <nick.alcock@oracle.com> - 0.4.4-2
+* Tue Jul 22 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.4-2
 - Ensure that the DOF ELF object does not require execstack
   (Kris Van Hees) [Orabug: 19217436]
 
-* Tue Jul  8 2014 - <nick.alcock@oracle.com> - 0.4.4-1
+* Tue Jul  8 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.4-1
 - New -xcppargs option as part of fixes for the testsuite on OL7
   [Orabug: 19054052]
 
-* Tue May 13 2014 - <nick.alcock@oracle.com> - 0.4.3-1
+* Tue May 13 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.3-1
 - Fix array underrun when no textual mapping for the executable can be found
   [Orabug: 18550863]
 - Fix unlikely buffer overrun at process-map-read time [Orabug: 18550863]
@@ -920,13 +920,13 @@ systemctl start dtprobed || :
 - Fix error-path dereference of uninitialized variable in error message
   [Orabug: 18550863]
 
-* Thu May  1 2014 - <nick.alcock@oracle.com> - 0.4.2-2
+* Thu May  1 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.2-2
 - Interrupting dtrace with a SIGINT while monitored processes are dying no
   longer hangs dtrace on a condition variable [Orabug: 18689795]
 - Symbol lookups on processes that died at the same instant now always fail
   and no longer access freed memory [Orabug: 18550863]
 
-* Wed Apr 16 2014 - <nick.alcock@oracle.com> - 0.4.2-1
+* Wed Apr 16 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.2-1
 - killing dtrace while a ustack() is in progress no longer risks killing
   crucial system daemons [Orabug: 18600515]
 - Fix a leak of filehandles to executables [Orabug: 18600594]
@@ -936,7 +936,7 @@ systemctl start dtprobed || :
   [Orabug: 18603463]
 - Fixes for newer versions of make, ld, and bison [Orabug: 18551552]
 
-* Tue Jan  7 2014 - <nick.alcock@oracle.com> - 0.4.1-1
+* Tue Jan  7 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.1-1
 - Install showUSDT in docdir. (Kris van Hees) [Orabug: 17968414]
 - Install ctf_module_dump. [Orabug: 17968381]
 - A lexer bug was fixed causing spurious errors if D scripts contained a
-- 
2.51.0

