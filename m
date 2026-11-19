Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795063343;
	b=keKA5mSIznCd3xt82ttYRZEV6uK1DlZMcK0SZ11mZgq5aHm8fq5UHim8NZfS/+NzAElb
	 2xzPqBP0S0ZyRSRa0CIC1QstSnlwkjRXu2KkSmt4swkKjbTV1xbOd3Z89HZJNM8xCi2+M
	 aIDp+JrntaArREK/NbrbWbQtd1dywMZdJk+jm9OvsrRGEYtkhlUc/wT6Qadp1ru/aE2mJ
	 hb01/DdZsOFwqvx/tkiDaWwNfgfleKHBOs6hy5je44a6B2h/6DejOfIa9JWAZPCAZqP9W
	 2n6MvdqfhcttedSHTqHsf3/tFwnOvhFRBi/dDbZpAAgIgnG2vrDylyD2OvTPYB6rhkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=jDiZJGF2MugUygCH+n1MeT7d5a77ONTMl+8V0C/tuTQ=;
	b=EplLl3d9KV1lPHQNn+fCZ3s/+O08fcq1t+0QsUWQ48xxiT6Pg0hs8k8mI+L5c0KI3cBF
	 8SIAnfkGggAVKrvQ1NwShcMKQFrP9piXti40glHEN9zuPJ4En8HDLouis4NHBV9MFLIIz
	 Z58Y5Z9umqGp1Dql56fEzVy2MOWAjTolpeKdFzERQYOte+sKDbPiCZfi1O2SB2lDrXupd
	 /1pK8fFIiAbOymfdxhWxm5+ZkxL6k5kqPdCwdYYpm7AWRi0Sph+6BaxKn+QjWpBOGaaxX
	 RBjft07a303vFRt9r4sOprg0204jkXhhLH2pbYYcDZ39oqke6vVYCDYFpMkEQHo3RCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=X6ofu2Ek;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XXLxg0ZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9560A2609
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 04:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E9560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=X6ofu2Ek;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XXLxg0ZW
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ0SE5J3409928;
	Thu, 19 Nov 2026 04:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jDiZJGF2MugUygCH+n
	1MeT7d5a77ONTMl+8V0C/tuTQ=; b=X6ofu2Ekt0yWXcv33JlXsHKYdcKbn2P8r0
	2w0G0nsxzNPFs2R6kZKG7yJIfGCIMo5SH8zFZJBjl7hpR87caIJJQyDxREJZ9bOQ
	thkUcDPW7YcE2stocO4n6uMcAKKi08fCkjB9yaZYg9bv2AZnpgFLBHINDsk9G7zP
	TlPttRyCmlCWmjLtpFFlcvUd3k14Wbi2YG78ZI9QvN0XQ97eTtc2y2HmgRDx0IMi
	rqdGyEHmBBUgNWJ5G62eBZQo9WINEULoSxnlQNMB4dxrQEv3kxle+ReJqDcMaevk
	R+g+QWiBsj5Fb7tj6wKdvbjrXhoFFqUQVMt2FtUl15upwwwdRTqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4j0ytsa8pf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 04:42:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ4NTTY3871972;
	Thu, 19 Nov 2026 04:42:10 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4j1p268bd7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 04:42:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh1Hk5E2uGThG69m3hroWFBdX+LR0VFbO9NgMiufQKICs0AjsySBbgzwvcd57aKJI1/OpqJkgpxMeD9s7/m9/Utrhlss1xRXjv9RFFDwtr+lli2dHd9JcrPMlZPzKf5yUHnqDAvvY1AMN+NdJloOAcf9ANNR65/goQdu6GIhps797IW4QgD6mzcaLM2JxfouPWxyTAVI8VywSaHaO2dim+jwPn/Zk8ZxodvSEBKh/j2kQpGcqpxTWVD61xA7I9asBA64Wm/8jOXHOq+W/xCUbC2b83cj2GF7wBiSPPebSDHhKd74yYb3Mm/lEQWCBll8Pl49aEcSfATRkke0x1rVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDiZJGF2MugUygCH+n1MeT7d5a77ONTMl+8V0C/tuTQ=;
 b=y0/Ss+4TnAs4VsI7cdwUVAqBR+gvVhTyzNGHHtCesT/8G9oPQFyPZ6UAZoNrxmW0p1ShXz2kHt4vYuPoN45giafn1b1/zXs8MbeJSFrtth0WTDbw9LjndPYC830huxiOpOLVgkQGlXsFnRau7QLZL1TRHFl4ju/6QL9gDHl3M9rc9adAseCqA7OVad5ZsY7902iazl+DrkPz8lYoGwgVWgWN14t+uVx+URwWGCl7P99yR5S2Do/K5G36PD3ibDxZMplatBMmNYL3KZ48vk5rcZKNsY6G9piotF+T4m3zUWxeB5Ojs5LcK0ROBtyPia9EOfcFdxeowkEU0MZiDrHyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDiZJGF2MugUygCH+n1MeT7d5a77ONTMl+8V0C/tuTQ=;
 b=XXLxg0ZWu0Vt3XiExQ+Q/synV5GYunIk91Ck1zwlpDgu8lDMWt6nIBMXIz8pPTTevdZU52IFlzzPWDb/aljmvUEmwXWUfFdYMDDIKXgoGIaZtPi/u14riwcbza3/tJHdqvEqy9dHcPaEgw3yhUoOXli9Us5o5lfbX7PfhFNKXAk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB997552.namprd10.prod.outlook.com (2603:10b6:8:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 04:42:07 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 04:42:07 +0000
Date: Wed, 18 Nov 2026 23:42:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: ealmorshdy@d-matrix.ai
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nix@esperi.org.uk>
Subject: Re: [PATCH 2/2] test: add test for system daemons with regular files
 as streams
Message-ID: <av5-G0XAipqPbQZ4@oracle.com>
References: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
 <20261118-b4-bug008-daemon-readlink-v1-2-187c9eb22d11@d-matrix.ai>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-b4-bug008-daemon-readlink-v1-2-187c9eb22d11@d-matrix.ai>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB997552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a875d95-fc5f-424d-917a-08df45f77727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|6133799003|22082099003|18002099003|56012099006|4143699003|261026140227099003|5023799004|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021135927099003|261021121427099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SXUxR7wdoISC0RC1RI6QNPGi0z16L602MvjIDAGQvWacaMvXDMZ+QLbSrJQSIuqZ19QAgK6Rnyv2dxccw5uShqvuXRo948Wx/b2jILIZ9/LcZlzVnOzcyIGLWN5P/twFu5eWfreKG86pMUQIM+X5DPPKFC5mHzgeM36eN3X6BzEkVypgXZT+SaQJ9UFBEksYwcFXwrbCDrKzg24DoAnmi6ggZKktfJ8kLkJV96IHnROvjxWPPjiEIv6WSR/ATiNDAtvRggTpl0ZRgK0LDLh9M+WFADH7UmICzKqqFkXx5KvlntyWuwUl9yDpRgSQrYeJaVDMFJ3t5tJOiYYdn+oi/iOZRf8OHYDajbnjou1T5Wngi/5emH9Im4lG7YmrkasJ38OTymgPH+MQORSXY13Bp0WYPHsQL2tvfr/ID+Z3mjPBAefQYI8L98cFH5sho0WNAsGbxwRMLJRg5+m4m7xZo9j9ldd4ay+PUmCrG79hYhflAhTXRUuA+y40z31jzfxy0ePmoBZ4F8HjtESi9aV4iieUNHbZzKNnzvtMWQ6r8bq2zYqIL5XX9cKOoAFWyZHrrFWEjrQzrp69Rt5BBW8XxeNMlp2APbXwAkuHN4YO0I65Fg4myEf2JcwmQ21IaoqkyYxPD11Hobp4bgrxE6gWCdW369/AzHh2pri4hAK38Rs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(261026140227099003)(5023799004)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1KWZ1c7Z2h3sl6HJfqTjMcLhNSzL0P+MCvKiiAcOohB32AKgD2Bd5Z712Y3?=
 =?us-ascii?Q?uO+M7ywHUAV8YLEzZBInFGgowuDvQFg/+NlmYkBLDpc1bpMCr1yUMFmPouio?=
 =?us-ascii?Q?VP1lGmrYzudTq/qwyl8GWmaiPJLF4dqS3jI1xIEhgNsXlO41lc6renckBB7U?=
 =?us-ascii?Q?Sz/uTKaNbpsdmSVBl5Z5TdH+0O5mm0gXO0X8egm5LQp72BLnDTFQVJC9aINJ?=
 =?us-ascii?Q?Yjt+gaUtoyS7OIGMYL5xgkkcg2El78MW9A71bO1O224548UFyv5Q4TQ1fYOb?=
 =?us-ascii?Q?O4T6p8nhlEbTFoDHv/tu8+SKmEtnLJkMW49aDCR+5npUdHFqCZlho8rMX3x3?=
 =?us-ascii?Q?v73u9nKrUkfCiK9tiUQqZFDKjBuy3U8mzA2I7kc0YWsgUROe171wMNQesCDM?=
 =?us-ascii?Q?YmBMVhBBvHpWuP13NqGTfeNFvAoslDZ2cxEhw6eXa1AaB0BC8B9dxNsCbcMN?=
 =?us-ascii?Q?SD1HtBUvJ8GNfF9/nL4tLnx+2Xz+IFF71YzlHVmexup9EvyC9nIrfls8ZXV1?=
 =?us-ascii?Q?kUc9TbfW8IvjULlHPS7PiU3LIMdMwYdpKzT5ySjXxvdvt6VL8Hgdd9o59ut4?=
 =?us-ascii?Q?SD8tm0SKqeTcja/6blCUsjFYUdpplM+BSng39zLN/rup1WFo0xB4fFJyGs0E?=
 =?us-ascii?Q?kWSGPrBMOhxkf3cccJ7uIi/ShkWpyzQbsYQisIwGMyOQwDwhreT8ikm4vOwP?=
 =?us-ascii?Q?QnHSlBO3WjhimJGpXTAIj5pJV4YLqWaFcUZ/75CNSnHZbD28fQu026FwZKX7?=
 =?us-ascii?Q?830qn/p40e3cjTx0bNAgtxmO7algRSD66c7Mx6EDv0TKFuS+9J1R5CnIdJbr?=
 =?us-ascii?Q?GTFRdRLOhSaNoPvJtVrA8M4rSsLCk0xjaWrZqCTrPj2rFjW7a9XAI6gHGegy?=
 =?us-ascii?Q?Lrzr9MdaPSozlodkvqpr2Ql0OoP10Cu2CLoxh6jQ1Umeej9uUalVFW0S4QsJ?=
 =?us-ascii?Q?o+H/9/TvtzU14fLEwRLaTdM0tvK1QaCo6cDSAQ8iANp7j1L4ytCc+0JboZCo?=
 =?us-ascii?Q?2Trp1SA1lSE27QF0W7rtWm1E8/A0MDgGzn43hN++W44d4hyc9qhHO5hBpI6f?=
 =?us-ascii?Q?Ncw+XbpmcsYckmWNIpPwmXd5L25FNU7yBy7Y9DRXB994ouY+N8zKSrvhblmr?=
 =?us-ascii?Q?BzDWiJ9pDZ7SRzLgpuvE6dNA8lG6mKuhYSv9QjZBCvIOUX6Li7GY5XbaQJV2?=
 =?us-ascii?Q?pXVj6qrJySPK0EzcfkDPWfLLhNbbyE0OYQqvkhTUGcWmefMX0DpbV+pgQ9/L?=
 =?us-ascii?Q?tdCj1q/sx+b/e4Fi4JjAqNuIGKPYfofhM1ZCzZTxk8Gl6Xpqe/86UNZFg748?=
 =?us-ascii?Q?pfCwby44M46WR43ctoMi3yxm2CNmQK+wGsJAyNanaMM/9E655nIG3SMxre3J?=
 =?us-ascii?Q?Y+t91krzHktNv1SOzCS3tCNUCLVJo2/cYJ26F0T9KeXo7/2Qt0nF+IRiO9ai?=
 =?us-ascii?Q?BBZz0rB1Cadtyem18B5hHVVjym1AOeBV533UCcNgxcZMUYiG3cem9uxBGihq?=
 =?us-ascii?Q?HM/43fRZt9rnqxgfJU4g1ZRmNAZl9iMTnL/82yP/EQXIu9cou1elSEgxuaT6?=
 =?us-ascii?Q?tcJQoCZVqVaxqOiozXZfn+9af87PemvHQWoZ6JvyKMD7rKvJAlM4BY7OWxZ8?=
 =?us-ascii?Q?FRWuYdr/Jq9tbDoGTuMz77NBpNgmUl+Yakl9Al2auKFVRDhMl+bhMqy+M8HZ?=
 =?us-ascii?Q?j7eX79CaKhFtQ14C1c1p1hXWQz4QidcZjXi676K/myhheIqLA7yEmzO+2OKI?=
 =?us-ascii?Q?uYgrRHYaWw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	bx4fBeK2QwE+B4Mn5aHjZKFAVh/jXwtOFHjMCZyditaxefzee8rAMqTMXQyHRexya4Nk7tiU/vMtY3BvHzxMb9HD3I7+wf/HG601zltBBhjs3mZObEidM0b7dvgDVBLz1arUAL1d3CbIPeijeeJ4QfFuD60rlSyv/aUus206HXjOGpgl3TF1HAqtt4lBpIzzFZC7JVWzandCSRlFe1wAiKUhieAIBY1AJ0mPLuZ97vEuYZibtDh9EcdV8H2JnxbAnI9BtIqcbIyWTZInlDIFRbbSasatcFoTwpY0DBx1lQC7HCZeOeTGC9BkSBitCLIJ2DtLgbD5Zc5yQMGge1upRw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+gbZ2abc1fKuSYHyJHTH1cv+u0gBztTG/oR3jE08u2OE9MLtSIDrlp03sSF2EQm2PHpiYM7aTTun6SX5RuPd8bMYB6UrEFmvY86hpA8259Gwqiz1V5AOT/cwY6C9JoUeuh6JavPJgdBUjj1meami+JbB+LY9D8ON/JXFwOW19MBaADQIJgKXyntsEqGImvnLlvClOwxerpL2ji1Hpajzlka74n8lpx5D7Yp60j+FH2AwpwjeP1xWwSmeoh7j39A7ZXp+g9kwdFFXjJDVVmb0rW81ooLEx+LDyW6aQwHlIwOH9MoXNcG1c+hd+Wahv5Jy7D7Go9yWUJ83Haj0am+WFiC8sh2nA0F/8ZgQMUYsDqZNYh2yERLTs2H0ErR+C2t0ZhqgQPAfipE73m1JqEFVJWs8XyeVPjNTJC0cQ4MkTkZOnk8UGd3buFtzktQl0Q9NJfUXDYFE/DBXsdcMUTZwa3fDwTbBukzied+Tc6i6sT66SJAMGkrbu0UNrhGtBY9FOMpjgXoUBchsLxnoF9+bpnPIgivbo+Qi7yRpaQ8Cf+Of1DBsp+5hINb0cSHE6lmBl2fuSj3iDrwTu6jkecOFaZXfi/YjwZGae074lJUPwEA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a875d95-fc5f-424d-917a-08df45f77727
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 04:42:07.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NhtmSwZjN3sdc4zcNs7oF/1qsf3Vt7fMp4wHPkJjp2DxEtPtoloZPH2R866KDWkmTD7QtOYXNBFQoCp1uPckRU5DEzytEL9sCASUGkCHC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997552
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611190018
X-Authority-Analysis: v=2.4 cv=APpTTis9 c=1 sm=1 tr=0 ts=6afe7e22 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=0U7IOh4INL13C5rPW9QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: SFjhGVRoj1ygJIGcGoa9oQzstnhNp2Du
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxOCBTYWx0ZWRfX1BNDTDhipF/R
 kjP8er6SVL9wT+IIOfpUlfsggISv6wJiWLa4kjwwbUpQR3fle9plmPx+VEpgBBcWYq2UhDlNSNU
 QbxQIhqylziP6qxapJwqqpAA879nV9CjfTJBhryIxzWRkQsnPITw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxOCBTYWx0ZWRfX9r4zwchgDiaI
 V45BpW9aIscELG+cjd7ipW1D5UcDOImMBrlxBdYIT5NRFxzeF2D3e4TGb/4SHQG7V/4trbNUn0C
 t5PbqYmWdA60f2GiHqVxOf3IYoH64Y6fwu8PKU/cYVho3TYU0HwOwwY5tk3PrGfc9Pco505dRwx
 hrVpXw69QAac2KTyqeUdKl8dXD5BLv60Uzfjs5EVJcjPe49/FN7b5OYa64jPAZJrO4tY3ZUR4m2
 +8ahe3nPSKp7+63Zq8yOFQvAfFqkWro63Vt7gzDzivR1dKAyOHHcX5Y0R3aFPDvqaXpfC538V4n
 CLydJ1p9wB0Uedh4E5N05XWiIzoSj/MjzzN4GmdUv1ThVRwIvteptQKeYUxbKVqEbgQODteCQrh
 s0qgLysMFjcC6oyyKUfSgvWpdlztBjQMBpsVDns7xL+fh4P0YjUO63KHpP2B7DyO4Wb+y566Kl1
 GNV2lIFTH7E5kRDjivA==
X-Proofpoint-GUID: SFjhGVRoj1ygJIGcGoa9oQzstnhNp2Du

On Wed, Nov 18, 2026 at 11:25:05PM +0000, Eslam Almorshdy via B4 Relay wrote:
> From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
> 
> Start a root process without a terminal with its stdout to a regular
> file outside /var, then to one under /var, and check how libproc
> classifies it from DTRACE_DEBUG: not a system daemon, then a system
> daemon.
> 
> libproc asks systemd whenever /run/systemd/system exists, and for a
> process in a systemd slice the slice decides.  So on a systemd system
> the test runs dtrace under unshare -m, in a mount namespace of its own
> with a tmpfs over /run/systemd: libproc does not find systemd and uses
> the rules under test.
> 
> The first case fails without the previous patch.
> 
> Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
> ---
>  test/unittest/proc/tst.system-daemon-files.r  |  2 +
>  test/unittest/proc/tst.system-daemon-files.sh | 94 +++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/test/unittest/proc/tst.system-daemon-files.r b/test/unittest/proc/tst.system-daemon-files.r
> new file mode 100644
> index 00000000..0a2b3945
> --- /dev/null
> +++ b/test/unittest/proc/tst.system-daemon-files.r
> @@ -0,0 +1,2 @@
> +outside /var: not a system daemon
> +under /var: system daemon
> diff --git a/test/unittest/proc/tst.system-daemon-files.sh b/test/unittest/proc/tst.system-daemon-files.sh
> new file mode 100755
> index 00000000..a24b5eb1
> --- /dev/null
> +++ b/test/unittest/proc/tst.system-daemon-files.sh
> @@ -0,0 +1,94 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# Check how libproc classifies a root process without a terminal when it
> +# does not ask systemd: a standard stream to a regular file outside /var
> +# means it is not a system daemon, one under /var does not.
> +#
> +# libproc asks systemd whenever /run/systemd/system exists, and for a
> +# process in a systemd slice, as this one is, the slice decides and these
> +# rules are never reached.  So on a systemd system, dtrace runs under
> +# unshare -m, in a mount namespace of its own, with a tmpfs mounted over
> +# /run/systemd: libproc does not find systemd and uses these rules.  The
> +# namespace is made private first, so the rest of the system still sees
> +# /run/systemd.
> +#
> +
> +dtrace=$1
> +
> +DIRNAME=$tmpdir/system-daemon-files.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +case $DIRNAME in
> +/var/*)        echo "$DIRNAME is under /var"; exit 1;;
> +esac

I would rewrite this using if [[ $DIRNAME == /var/* ]]; then .. fi and do it
immediately after setting DIRNAME.  Might be a personal taste thing, so if you
really prefer case .. esac, I'm OK to leave it.  But moving it up makes sense
either way.

> +VARFILE=$(mktemp /var/tmp/system-daemon-files.XXXXXX) || exit 1
> +trap "rm -f $VARFILE" EXIT
> +
> +# main PIDFILE: leave the terminal's session, write the pid to PIDFILE and
> +# sleep for a minute
> +cat > main.c <<EOT
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +int main(int argc, char **argv)
> +{
> +       FILE *f;
> +       int i;
> +
> +       if (setsid() < 0 || (f = fopen(argv[1], "w")) == NULL)
> +               return 1;
> +       fprintf(f, "%d\n", getpid());
> +       fclose(f);
> +       for (i = 0; i < 600; i++)
> +               usleep(100000);
> +       return 0;
> +}
> +EOT
> +$CC -o main main.c || exit 1
> +
> +# run_dtrace DTRACE ARGS: run dtrace, with /run/systemd hidden if it exists
> +run_dtrace() {
> +       if [ -d /run/systemd/system ]; then
> +               unshare -m sh -c 'mount --make-rprivate / &&
> +                   mount -t tmpfs none /run/systemd && exec "$@"' sh "$@"
> +       else
> +               "$@"
> +       fi
> +}
> +
> +# verdict LABEL FILE: run main with stdout to FILE and print LABEL and
> +# libproc's verdict
> +verdict() {
> +       local pid out
> +
> +       rm -f pid
> +       ./main pid < /dev/null > $2 2> /dev/null &
> +       for i in $(seq 50); do
> +               [ -s pid ] && break
> +               sleep 0.1
> +       done
> +       pid=$(cat pid)
> +
> +       out=$(DTRACE_DEBUG=t run_dtrace $dtrace $dt_flags \
> +           -ln "pid$pid:a.out:main:entry" 2>&1)
> +       if grep -q " $pid is a system daemon process" <<< "$out"; then
> +               echo "$1: system daemon"
> +       elif grep -q "^ *[0-9]* *pid$pid " <<< "$out"; then
> +               echo "$1: not a system daemon"
> +       else
> +               echo "$1: no verdict"
> +               grep -v DEBUG <<< "$out" | tail -2
> +       fi
> +       kill $pid
> +}
> +
> +verdict "outside /var" $DIRNAME/out.txt
> +verdict "under /var" $VARFILE
> +
> +exit 0
> 
> --
> 2.55.0
> 
> 
> 
> 
