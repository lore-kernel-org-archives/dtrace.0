Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6A212168
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866529; cv=fail; b=L5VeNPpvIuezsx/CCX1SnmPasylID5JMqiP+QdoMTCDFObCw6RTe4EMPhv/CZmwE90OAAfkJxntW/Mv+4jY8f44IU42Mb3QV/Du2iOpUPCylmTcIENvwINfW6YTgQryJyS6c6/IM3fN/3E2nOVx4k9L2OvYq0TX5AQJkzNaYTrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866529; c=relaxed/simple;
	bh=cGlazM9cQ/oIbUIKkPjPGLE8d6GDwlufGE+latqyTaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OXW8ysqyTIAWarxC22g2C/+sQHigu7pgQbaQ55ooKdQqnvk7OkRaIli0FxS6R7Z3AFQ+fAHqf5MYPFouhGgXZ0N5G2J5dkU8ecshEjPzClbbjCIX34gVGQn9UjZSCSDgI+4L4XNPfl0GZ4YxiaDlg6Pel0XNpcONuRhYNHMXRvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dTvI1yW4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S1inEhfN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dTvI1yW4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S1inEhfN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDhXcN005223
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=RR3svr5/JOm2Mu8bVM
	YZu/p2P5I63owhurvrk76709E=; b=dTvI1yW4aTvyXtCbCor/+QqWN2+2kNTRAf
	dGo6GKE6jxDZLXlKTJIgsJJLPYDSCX5vUNNoRTvc5G4eASwzJ5iFch5huH5+F6y3
	8SjrWKWm+BUiWFGUbj8A9M1d4YH8tcyLwHbfFuqVd46B+VFQd/AbVkxlVWdXESP/
	AxoUPoC6wqU2c4uQbrJXeMXjbEvVWA8oHBnhikGb1qu9A4fH4fI6dEImYe4vS7pN
	/cs7sJIaKtuQSvEPsPLx3MrVUCcUpnaXbG+iCxQT9r7k1iiFgFPy0BpK7+1S9uyw
	tgsAA2BSwNM2BwCF1Zi8th3Gszhw++Em0jx13p1YFE70UljKt1PA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v53jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:28:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEAkFq015746
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:28:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhcbv1v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gb7n+UkmH4pwrxkC0ejH6c/kpIQqTKQscqLKeCaP7w1iP3zc60VSYA0lns3k+XiruZQL4CGx5kG+GkhbcsDk+nOw2EKNfY9//n5GD6c8cijcqNpZNgavUjaMmgUU4vVxu8KLY6npvjRNUMDW5qVnftFeZO+N3u8PURleo7IXkKOJdNLTbUZ8M1XxnoQasQgSzCYJZi8a22RsSyJiuSbS0OElzw1maCIcI9lKS+risvHp8poIMWVYbYFeJ6NlMlO8QEwtDnQQ3COhPjeCQDqLyWzWxBMlPebbh4kGEplUAMtgqVYGwQqxpK7ThZzZ2s0epq9Fvnm4zSuWp/Ut3Q9F+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR3svr5/JOm2Mu8bVMYZu/p2P5I63owhurvrk76709E=;
 b=WmOn8d7rpG/cysJZeUjwZ+svR4ImYDTGl2+yCsovPGQlwvkMNJRigB+RBz5H0FBlk10DzM0zwUKHyd+yOPy4AlQj9Z6YCMOfzUDaVIoZwZXgawz4zEGjMyA1M+SHZPwzk4Sy4gPk3Ih22ffaVEtTg9NTszv1zFGikwwOBwk1GZaLnBJiKCcJgNR6oXoEaZdM3Tb0ST7vxnQtfhi6pqyIZBbO0tlPLyblOSr92eltkTQ1ePBU6Tzz5wr4rG46UcQvKDrDBJP0vrvToTz0L/0bcOt5kL6UFA5S/6678nOo9oQWepwihfqXBcp6v9OxZFlGgrHg8FbiXBb4fwatnXCrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR3svr5/JOm2Mu8bVMYZu/p2P5I63owhurvrk76709E=;
 b=S1inEhfNAzyyvOShJqBFcd33tHOs/kNfb0WcFAWSK0HqGoSjS8O8yMKfbQrYHaM8ApKeVvWuCZKCbo1MISW41qtc75nolOg+jo4pdNllCRzNEIuNhqeXDyLMbx8vAK8zK2V1CmWgVMgsXtQWKFmKxOb2BLxUUQCONceY4z9huXk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6824.namprd10.prod.outlook.com (2603:10b6:8:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 14:28:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:28:40 +0000
Date: Fri, 25 Oct 2024 10:28:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 08/19] Support multiple overlying probes in the uprobe
 trampoline
Message-ID: <ZxurEgrkXviDAK5I@kvh-deb-bpf.us.oracle.com>
References: <20241025063423.20479-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025063423.20479-1-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P265CA0113.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f164169-45b0-4bb1-c51d-08dcf501527c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QhkCLDbj8l3Hr7PCsdLJsl46e5vfdjPIyAufOPrNpAmo0i5GBfKRp9muGQUi?=
 =?us-ascii?Q?S4LTeBCyhw+/5Le6/G8IIPYk6mccsuHHpmWFXPfGtW70vYJjhZIHNGD9yZr3?=
 =?us-ascii?Q?u8eCfHqQU2X+N+TvVoo2EsPkCTPdTCr8m0gLp+qL4XkMA9jAKF+CHjHsECHY?=
 =?us-ascii?Q?es/HbokW4zIRxWnxwfolmzdS0dkLlGyfPa0OVAQu6G8ZU1sjt/XtV/fe7a0N?=
 =?us-ascii?Q?REeqWj2QnmpR65MwvoTCJSj7kmdUIsV6DMU+sC1KZGbKGILNul0qaD/wjPDy?=
 =?us-ascii?Q?ICzrl6Fy++z2yVPqzUNOUjOeSorUii89F4D3KXdmVBG/Y/nW3ib+G3yGiOkh?=
 =?us-ascii?Q?J4AQxhG/82l/nE6oZQGYWy4yfFIT32KRhkt2i8ytqjcF4AkzEKB/wbkM7pyq?=
 =?us-ascii?Q?PruewTA8G+qGWKp1K/0MefBC1HvrpZoHUmiK0+LM+n3HN4lv9SERvyWWykQH?=
 =?us-ascii?Q?3+aDmhJ07nEke0fgw3FrBZwsL4nuGRIvWWlkdCSfTTHDpiXMk3o4ZyuigEuO?=
 =?us-ascii?Q?99TeB2EimhnLDAqQGhs9okUY9aLx+jbndn+jjDvoHlIBTJU5c7dJoBSTj9t8?=
 =?us-ascii?Q?WPlN9Cq+Tx1laAyA2nSDs9RjSwfX5BPFyZ9eUEjtZSPC5f1Rnm/DOziApjE+?=
 =?us-ascii?Q?vxgK00pFwhrtx2SvxX79L/0uKavkW9y72OUHax52RF324aOa9soYbkcR+dP6?=
 =?us-ascii?Q?JlQjdDW3mDdlzVuV9vCg8WlJrcnRBZxR6ytbYTzzvJmhJ8csnmbcKR8uEXWJ?=
 =?us-ascii?Q?mGKjChwML09VLzdxknku1SK/6CH57FKfNTxXz4pNiLfQT8g9grqt3uR7nuph?=
 =?us-ascii?Q?yqU1OhwiRjNPWAmby07/4+Ox24A251cZPP1BO0d/YywWbf0vo7edIdbn1J5Y?=
 =?us-ascii?Q?wLkx3qJujsRpz93i4DkAf1iASGyJkf9KbjhZF0U/yR9b8lZvVaky6Le6D6Fw?=
 =?us-ascii?Q?CVHF8pdQen9KVdg3tOz7wMVkzcYMbWNjENwC7aU3ck8nyofbuxTlkdhRasuh?=
 =?us-ascii?Q?YMZ+IJtMkWx4esuCj3VpJbNvxmAI5SCg3o/95dWBKVVJeOH9w9uhLmmojaPt?=
 =?us-ascii?Q?8DLtKRmgO/Ek7V+Fxr4tvFwXCCRhri9WSphwXbtYN8IxFbPRc4lyyqBpaohN?=
 =?us-ascii?Q?6eg/XpGH3bcD3mV5poL3wzdjCEi4cVqBOdfmLBoanmq4eLzWe6VTalMNZYPy?=
 =?us-ascii?Q?Fxsebuebsl7ih5F+yM8zwZbFm6NWoFXbz4e4/RJY+DnXXrFgfyB9b7NJTFRM?=
 =?us-ascii?Q?s9dPUgFMDCtsIe/DI2kxZLkv0Mega1LvkSQxrQeyR4he8gFdPUbqW8U+LqJj?=
 =?us-ascii?Q?gQbBLUChE9/UG9ovc8AoDY8T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s4pDrAxJ1JsNg3uPmOJ5WePWExFFsoSEM74WkLxwc+8xaeBg34VIvwzzYifF?=
 =?us-ascii?Q?QYqE99sE1aKNfsqZjiMOCWJTuxRNFw3SnvxNrirA+mG9NKxQZe7os0xzOOvu?=
 =?us-ascii?Q?Cnu+slcDxdie4mhCbeViy/Iwxrn9JYsPxYz6FnQHEcHsJPL4xLJRuI/d0MJk?=
 =?us-ascii?Q?43jMdYg2EggrerHt0IexDoEBzQgvJghDznqm4wWIGQTePX9ceXed598adv5A?=
 =?us-ascii?Q?AUGNTufrSY8a2jL4nI+optgY11u+TQKbEP63JRYwLbiPCOqcaqm7Nag2ss54?=
 =?us-ascii?Q?+tWbirETXUnqezQ9e6eGZhgMLG2bnr4C8ty8RpZ5Iq8PsYoRn0971ybuLbhS?=
 =?us-ascii?Q?PgJN8mcgU4cnC1BBmN8OHcP9V98fvAKem9bVUuZjhNyOHjxKcJLnkzbPkCgN?=
 =?us-ascii?Q?bIbdx5rhcw7IXEiXBKLGGsyp/mYwn0KIFwm73y0DeWA4QcLT7NNU/t87S7uA?=
 =?us-ascii?Q?ELSkVGPRh8rMdXsmmfQp40O+AZl4nJTxc+TvKc6DyHCK2sQRNMQCVCC6UEMA?=
 =?us-ascii?Q?nMSqfj1iBWrxlJnmQAHZPMpY/TQhee/4KVrAvA4E7Cew33AtdcspBwE05n7b?=
 =?us-ascii?Q?lH2LOn1WSkdiqIpZZtF6W57qF2qrcoMIWjexf94dXSbzgGCg+W8yzuTbu9QB?=
 =?us-ascii?Q?asxlhU4n9YxSyhzO6HBvUhohwt/jmwbiADSB75EjqwB1B8wYbnlfnoScm2L4?=
 =?us-ascii?Q?g1y96PGAGWL9Gf/FFVPJgXNAu/A5AnQ3EhWqV/rZ6wrlkQ6Zoxpr6DEh22E4?=
 =?us-ascii?Q?GwkOWUCeGzbaodq7U5xlr7/0LIUN2kBk2aRKt9oLIxNCuZZ6j2lCM1VKxcRA?=
 =?us-ascii?Q?6sGwRMPdyWvhy1MDTux0rfA054dKpJAiev7DhDlm0lKGyG+r2kSD9yUoYWYj?=
 =?us-ascii?Q?vGgStNUrPr0/Agn0Bzj/SLxT6X0OgpcmRXoAppaX2+Uh2YszfKhsO8QyPMg9?=
 =?us-ascii?Q?ei9FedODFoZc9+ydjRb3lq17srySmFrl9dLOm5peiD5jJ18j6BKRhjZQt/Tz?=
 =?us-ascii?Q?HfNX7zZFMtvqjwO48jRsuG/VBEhec55A9jutDWxB996BckIUN7dknTJibRpz?=
 =?us-ascii?Q?AjcAo6uUFwWd7l+7bsqI7BkSdxVc+LywiepiK9WK4a7UZ46xlKwVZ+ZSdguY?=
 =?us-ascii?Q?rmQ6J7o/b/NHPInzJbt7c217u6lHoO6hSFUapyavteSWs7IyTIYdnl9P3R9A?=
 =?us-ascii?Q?lfkum4HM65Ta0FmHUkxb5B7oP17iSzarphjAPRP9nXOhlT2r6Go4/bhrxFW3?=
 =?us-ascii?Q?K+hOsuuv/WhLW7F4SOX+Err1NMzZEZQr2CmFp9hTTDMlsPdWMgSt/KaXLtR5?=
 =?us-ascii?Q?LEbg/63y9DwwYu5bcX6ykdXfpKTsMrW/9zjpglvikILNvPgD4gX1KGpjnQiU?=
 =?us-ascii?Q?l6FYwr/PxCmhAPha2OPxs0ilFbFgd+o/UEs+wCC344OE7/8/URbW+AuMsZZY?=
 =?us-ascii?Q?D1VhArorPev5zjmKNPbGES2YDxjUU77T5j75XyOX1Th4Az/9yFmQ4ms0UvZm?=
 =?us-ascii?Q?Mt9oLBStlK29LGr2Q3gGgzwdAPSLRXbjtgCqAG0Emx/io1Kbyfcggetkekyf?=
 =?us-ascii?Q?S3/+34U9LTsfW3TwI/evcsTgb+dE6r5pKQYfbdFxhrehQKkSVZnC4RFjeU9O?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nvnIYF0l016rF8QRJa7WU6VSliKWPsAa44HJH14gx9dTPP4C4+vyV9dXypgyW0CU1gkz8E0vBLfADr0fftvqArLFeFUG8dlDmQ6rGwKJZj2wteUPoCQUU0Npu1LwfANebBW9hw8OeyFZhZmpchZ+z67F3bme1EeM3sDGRUd1GO4w/o+6dxOU8WBQ8cVdQWhJHTfQwRmkzhcxZXUhShcWPNJ8inDogZrGX6rbxO+cCE82wflpKkR1LcohAg5RngHmY2/P/GEohDiG0NBRnb5XYtIQohaFn2YXbwvMFFHTEqX0Nx9dK66v2fwx7lXdvMRP0c7vZZPuPTn2iUlLJZGr6j85TZhZlLa6J35qq4r+cKrmT3xueLDl+mI43pn/+aT8WNGGDsLYBIsViELgpvLvwo08QHlwhQGko8j+5GU110azGP55jorDsJFc8t48JuBZYfdouONLdM9+c9Lp01J9ld90BogtYA/uwKoR7oe3IiKJUsQKpzBcowIjTo/2QYljtw+P5zUjMT3wrE5e2B0Imb2NLChJ+WWJDa93sbebLdgF8Wz4xHRZvN5TPhoHURZbEf9n1FFEezkfNUePebcK1FD9ZwjvCTfeOdpqtPWErJM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f164169-45b0-4bb1-c51d-08dcf501527c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:28:40.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tqIhvN7pKYzVKtjdSboBFjWyz6KYMw4By+Mv9QQA/EEEkBhNXjuOJ0XN9Lc+8sBSG5PNslz5KG0UMCb7KbVJHwquh9sp/cXL8rMmRIDr0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6824
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_13,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250112
X-Proofpoint-GUID: Oq4Q44d3PfcxTEVSeVDH00dlz7ie6BfQ
X-Proofpoint-ORIG-GUID: Oq4Q44d3PfcxTEVSeVDH00dlz7ie6BfQ

On Fri, Oct 25, 2024 at 02:34:21AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> An underlying probe could support all sorts of overlying probes:
>   - pid entry
>   - pid return
>   - pid offset
>   - USDT
>   - USDT is-enabled
> 
> The overlying probes belonging to an underlying probe match the
> underlying probe -- except possibly in pid.  So, an underlying
> probe loops over its overlying probes, looking for a pid match.
> 
> The trampoline would look for only one match.
> 
> However, more than one overlying probe might match.  Therefore,
> change the loop to keep going even after a match has been found.
> 
> Incidentally, it is actually only pid offset probes that could
> "collide" with any other overlying probes for a given pid:
> 
> -)  pid return probes are implemented with uretprobes
>     and so cannot "collide" with any other probes
> 
> -)  no two USDT probes -- is-enabled or not -- can map
>     to the same underlying probe for any pid
> 
> -)  no USDT probe -- is-enabled or not -- can map to
>     to the same underlying probe as a pid entry
> 
> So, possibly one could optimize the trampoline -- e.g., by adding
> BPF code to exit once two matches have been made.
> 
> Note that the flag we pass in to dt_cg_tramp_copy_args_from_regs()
> should depend on whether the overlying probe is a pid or USDT probe.
> We used to check PP_IS_FUNCALL, but the upp could be for both.  So
> check the provider for the overlying probe instead.  (A later patch
> will move USDT probes to a different mechanism anyhow.)
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c          |  45 +++++-----
>  test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+), 26 deletions(-)
>  create mode 100755 test/unittest/pid/tst.entry_off0.sh
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index e0d7da00b..7b5fbfc53 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -754,38 +754,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 *				//     (%r7 = dctx->mst)
>  	 *				//     (%r8 = dctx->ctx)
>  	 */
> -
> -	dt_cg_tramp_copy_regs(pcb);
> -	if (upp->flags & PP_IS_RETURN)
> -		dt_cg_tramp_copy_rval_from_regs(pcb);
> -	else
> -		dt_cg_tramp_copy_args_from_regs(pcb,
> -						!(upp->flags & PP_IS_FUNCALL));
> +	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?

Per previous review, no need for the comment.  The copying of the regs is
a one-time only thing because nothing changes them.

>  	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> +	 * Hold the PID of the process that caused the probe to fire in %r6.
>  	 */
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
>  
>  	/*
> -	 * Generate a composite conditional clause:
> +	 * Loop over overlying probes, calling clauses for those that match:
>  	 *
> -	 *	if (pid == PID1) {
> -	 *		dctx->mst->prid = PRID1;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == PID2) {
> -	 *		dctx->mst->prid = PRID2;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == ...) {
> -	 *		< ... >
> -	 *	}
> -	 *
> -	 * It is valid and safe to use %r0 to hold the pid value because there
> -	 * are no assignments to %r0 possible in between the conditional
> -	 * statements.
> +	 *	for overlying probes (that match except possibly for pid)
> +	 *		if (pid matches) {
> +	 *			dctx->mst->prid = PRID1;
> +	 *			< any number of clause calls >
> +	 *		}
>  	 */
>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
> @@ -800,14 +785,22 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>  		assert(idp != NULL);
>  
> +		/*
> +		 * Register copies.

Actually, what we are doing in the following code is populate the probe
arguments, so a better comment would be to state that?

> +		 */
> +		if (upp->flags & PP_IS_RETURN)
> +			dt_cg_tramp_copy_rval_from_regs(pcb);
> +		else
> +			dt_cg_tramp_copy_args_from_regs(pcb,
> +			    prp->prov->impl == &dt_pid ? 1 : 0);
> +
>  		/*
>  		 * Check whether this pid-provider probe serves the current
>  		 * process, and emit a sequence of clauses for it when it does.
>  		 */
> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
>  		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
>  		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
> -		emit(dlp,  BPF_JUMP(lbl_exit));
>  		emitl(dlp, lbl_next,
>  			   BPF_NOP());
>  	}
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> new file mode 100755
> index 000000000..f1a75b6ae
> --- /dev/null
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -0,0 +1,125 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +
> +DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
> +
> +$dtrace $dt_flags -c $trig -n '
> +pid$target:a.out::
> +{
> +	@[probefunc, probename, uregs[R_PC]] = count();
> +}
> +
> +profile:::tick-1s
> +{
> +	exit(0);
> +}' > D.out
> +if [ $? -ne 0 ]; then
> +	echo ERROR: dtrace
> +	cat D.out
> +	exit 1
> +fi
> +
> +# Generate the expected list of functions for our trigger program.
> +
> +echo main > expected.tmp
> +echo mycallee >> expected.tmp
> +for x in 0 1 2 3 4 5 6 7 8 9 \
> +         a b c d e f g h i j k l m n o p q r s t u v w x y z \
> +         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
> +    echo myfunc_$x >> expected.tmp
> +done
> +sort expected.tmp > expected.txt
> +
> +# Check output for probe name "0" or "entry".
> +
> +awk '$2 == "0" || $2 == "entry"' D.out | awk '
> +{
> +	fun = $1;
> +	prb = $2;
> +	PC = $3;
> +	cnt = $4;
> +}
> +
> +# Check that the count is 1.
> +cnt != 1 {
> +	print "ERROR: count is not 1";
> +	print;
> +	exit(1);
> +}
> +
> +# Check that we have not gotten the same (fun,prb) already.
> +prb == "0" && fun in PC0 {
> +	print "ERROR: already have offset 0 for this func";
> +	print;
> +	exit(1);
> +}
> +prb == "entry" && fun in PCentry {
> +	print "ERROR: already have entry for this func";
> +	print;
> +	exit(1);
> +}
> +
> +# Record the PC.
> +prb ==   "0"   { PC0[fun] = PC; }
> +prb == "entry" { PCentry[fun] = PC; }
> +
> +# Do final matchup.
> +END {
> +	# Walk functions for the offset-0 probes.
> +	for (fun in PC0) {
> +		# Make sure each offset-0 probe has a matching entry probe.
> +		if (!(fun in PCentry)) {
> +			print "ERROR: func", fun, "has offset-0 but no entry";
> +			exit(1);
> +		}
> +
> +		# Make sure the matching probes report the same PC.
> +		if (PC0[fun] != PCentry[fun]) {
> +			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
> +			exit(1);
> +		}
> +
> +		# Dump the function name and delete these entries.
> +		print fun;
> +		delete PC0[fun];
> +		delete PCentry[fun];
> +	}
> +
> +	# Check if there are any leftover entry probes.
> +	for (fun in PCentry) {
> +		print "ERROR: func", fun, "has entry but no offset-0";
> +		exit(1);
> +	}
> +}
> +' | sort > awk.out
> +
> +# Report any problems.
> +
> +if ! diff -q awk.out expected.txt; then
> +	echo ERROR: diff failure
> +	echo ==== function list
> +	cat awk.out
> +	echo ==== expected function list
> +	cat expected.txt
> +	echo ==== diff
> +	diff awk.out expected.txt
> +	echo ==== DTrace output
> +	cat D.out
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
