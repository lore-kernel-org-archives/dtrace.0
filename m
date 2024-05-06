Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C7313DDD8
	for <dtrace@lists.linux.dev>; Mon,  6 May 2024 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715022652; cv=fail; b=idXaSbdFUijkFJ9SdLLoc7JaxTeyeRbuxJFopl8n9s//aQEJD3QLswFILfO7Xd9tB/43UWiFjO/0i7+qYZWL8hPt6FlA7cvfBGcnr4dySJZyMlaLRFF4FsVANZeSajEOmjEUQgSQwMnOFYC50Fw4vC3QJa8ks5lb8cWmFYg9r6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715022652; c=relaxed/simple;
	bh=u6f9rw9we0SIctXkKrTyJQ9mEhyRXVcUqg0KXHF8Kl8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=V72iMGx0EuOltxI4MuzXULhAdMjRVndOG9MTmIFoOZNX0+Q3bQhJ4jzRh3BzslQZ0y5QLdg9HKg3Fbhh+r3oTugg2LC2Q7jvba6+2C9EYJJZTjs0HzyGTiv3cJjzCbKkdyOjgN6K/yxPXc3tqfwRu+3RqjKxa4t1nfW4yHlFcmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WKJNqra5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JiXBH3pP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WKJNqra5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JiXBH3pP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446IR6Yt009283
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=mAyWz+O9USiTiOZn8olxaAWuP7UAL/zAGjcRcTovK5M=;
 b=WKJNqra5d8yPf4/EcXCjJsM7iUB4mvfnPJl2BtNOPFy7NVcNGqoP6ShkwuPdqaQ9jKVy
 c5+kfD40un42b+YsnbbDmiPe7eeNo8Keqp9bzV5b/t55057vYIWXEOnM0ghK/08c02mp
 o6bSnOVF3i1qvTuABJHWIDIjeddXETI0ZgsBzx2BXWLvyiEZl2J59MszSw9SIt2cgfHA
 McrVLNv7qiCgGdQksMf0bosbuE1L9KIgQO6xq2N5kMYhEBxpr5Z1v4K88qmS6sAFHjp6
 AiBlLrZQZKRx6XxrgASYO0JhSqVgOe+nZ4XRdPkPG9DpySFpM3iO95/iD+q0mBXhtt/L aA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xwbeeuapa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:10:49 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 446HtFW4040816
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:10:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xwbf68x08-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfEBf+ryERHJBSD9RnC2YIbYw68kvWcfOHUiGy7utKwLukelCF/UjuJTjlol3Hhoel71y++Evh3jKTNjRMDV6/5mEyrZ3bQ/TetcljR+bLADRAYIG0Z7BZeN9ZJ9VBFM7U6YLyB7sE6v3xt86VmUy3X3UQ3OK0Yk++ED/uNzSuxrNOYDQ14cTP19HlgeICAxqDULBy5/7/rgHvz6nG4arWXO9u8Y/BYOZPV4hSuBWLTKnHON4AePWrNjnDXtUWK+bGVETT6oF8HLBEDOFt39zwOU30lR/TnT4MdSkWzsKFU/J4b7aBiIP7qsUHV1OMCUZotqBc7va57250FaD74MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAyWz+O9USiTiOZn8olxaAWuP7UAL/zAGjcRcTovK5M=;
 b=Z9MZ0UowV6Z68BoUkd/dSZmjaoM/XkPxLaLrZImL/4gZ98a1sB5kQk2W/oPbQkOEJl6051lbxyThau99KGd+gZeWIDzRIybP7xjPFwsJ+hv9ZWvsbrK9co7rB/B5v2j10p3Wf1jTjEreJskLGXXZh0jsVcKId0mu+luOaPYTh8AcU7dvGuBQWLzLAp8EBjaNPy6X+c1YBAp5ymmAJoeFcAUKP59SbLwhhKvhTbgSf9P9dB0G4PccD/PRajeUE6lgvoAjnD4uRHY6Ko/Hs/Q1eAUfGz3wNconoGmUL/FD7HukmI6P3CXlD/f1D3N0l7+OL0qawPCpD+CMe31vjDMh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAyWz+O9USiTiOZn8olxaAWuP7UAL/zAGjcRcTovK5M=;
 b=JiXBH3pPOFDbdBDOuOVDvpX/F0ZFQPB3BR14s/oDwPm1HVHvRdgCMuBPObnUWbATf1rJa7uU0rAXO3Ixt8zPBT+A7NjTqTLrujIj58Cvuhn6EYxmZFSkTAkstoRbx8STOYtru3ZkzQ15aJlflkeN3qffjC9DvHcADXUTQ27Lvfs=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by IA1PR10MB7165.namprd10.prod.outlook.com (2603:10b6:208:3fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 19:10:46 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::f9b2:8c8b:841a:aff3]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::f9b2:8c8b:841a:aff3%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 19:10:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf: be less picky about the content of bpf_helper_defs.h
References: <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: because you deserve a brk today.
Date: Mon, 06 May 2024 20:10:39 +0100
In-Reply-To: <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Mon, 06 May 2024 15:05:26 -0400")
Message-ID: <87wmo6iwnk.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|IA1PR10MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fc8cbe-8731-47e8-6c33-08dc6e003bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QHnUkMD8aDxgZ4oUZ6pLqBEfJ8O2kyeFPiR8v9Sm7lek7xGNRa+FPGEKNp9P?=
 =?us-ascii?Q?3NuIO05guBjpjGVmGIPhJBgZCRLVe2RDwBjPmBrNnW1xgq+giGxi7sl/POWw?=
 =?us-ascii?Q?qEn4kLk83OEHrRLQ6+TDyriKYeJahtOyqlw18RQnGpEugipG1xAPQYAiNsZV?=
 =?us-ascii?Q?EGn7MRbe74oLTH8Vz+qUjd+VWFrsfjFP669N4gPlcpS/dFTYMYBXsC+KJ+3S?=
 =?us-ascii?Q?LK7wRPdvjri4i22wa6t92bIZOF3KLweLt56pYMUBXqOqm6PRXXBmK9AK2Bxl?=
 =?us-ascii?Q?kvG85pZKKPhRbAgLlccBesaZNfghx/kSIXww3uJRNZZMYhR4akGXc9WQMR4N?=
 =?us-ascii?Q?vkYNCY+Ib1Mkhs4OgvjZNRgi7kNcFAjUDK12AXGi1CPHnEiP/TEAkBDuzF9i?=
 =?us-ascii?Q?cmKiOunR89xTLrRpKGxEI5RnElWni2Dsytls2KM03rh2vuENzTLE4SUI4BRz?=
 =?us-ascii?Q?+K0MRtEwZQzqVWVkPyWBD1JlD8ypRKvKCvMZr1HG/po1je1yHkgZhxCcxRPe?=
 =?us-ascii?Q?87pwlXH/Lk+3H/k39fiPvH6zzNcdoq1b5MecQaPANYMl2b+ZG9zkxkjrlNiv?=
 =?us-ascii?Q?7UsdE7tJdfykctsMWvwjE2cSc8w/e+S8pxVeGN/QT2rf+i0FCTJwQBZXtdsw?=
 =?us-ascii?Q?Gw4LFrcQ80HXCHYSxKakHFTHIBA6+diY6diALCw4IQjvcWD0pwq8agpoJe2j?=
 =?us-ascii?Q?JUN9VhVrykvbPMarXt+5WpEcU7ppr1ePMjxDv77OEUMEvq5grYp+YuGtRaCs?=
 =?us-ascii?Q?D14Fl9OryGpTqRktAOLu4kr/HUpjiFAdy/9PyrHh9mPqU5TEJchPHGwognAT?=
 =?us-ascii?Q?Jsl9Q9MNm/ao+7KLEebCLuAQ2Nl8iW7831qIPvOukCWqIeyrEEOzJwtuiDOI?=
 =?us-ascii?Q?7QcccYNZOrLVBhWVc8C1QMCy80HrcSQRUBlEo+x5HwFA8xeW0Lnp+LpMHPj9?=
 =?us-ascii?Q?5GaFCW5h4T4ETI0E6qEnt2uItlMODKQfedOJNA4VpQ8cSNwUZIt1sGEWsEG/?=
 =?us-ascii?Q?X6OtUWO6rIKScp6aSjYM41h89X2zaj9SdWrcGq8qhwRM38NCnXm8L9/Bit4w?=
 =?us-ascii?Q?DI7L7PY2cDvFycIbrFAfGPF0GdtsS6XdBXHLK086LOfh+UNBDpDdSbi0AgGB?=
 =?us-ascii?Q?oRN0Zmg5FCXTdBGZG3Xe0iB/lrFoSrF1eJOOaL6k96nC2U6gi5fYLkJeNwbq?=
 =?us-ascii?Q?DahjE3oFNeKfW3jMTr9+5iDjRsXP8Gx45Rbd5E/wkvynrA9x2YPTwKUB4s0H?=
 =?us-ascii?Q?31B6KD40JiSebrhK6kskS7DdoT4fWdAMAA5sDTIBlA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8axrvBX/lhKLT9l3eofGuLfmN+5uFz4BaFW2U6tF8m2QdgpdKn9Mrc6+bzaK?=
 =?us-ascii?Q?n4KIVLon46OwUns34OiBHaOloEkU31vNjBCnyX9FnRv0s1ko8cO3/nZTSEPS?=
 =?us-ascii?Q?Dunzj51L78dYnObSfW004LnOtkYsNpmnpqaGPnNiMP7n4GgVH/mpLq25xVnu?=
 =?us-ascii?Q?Z+t4+e1ClB8qlfKQKf0ApfG5xTHHJ2g7GxbJsZ6PRwCVWHb39sGIsDmFnnRv?=
 =?us-ascii?Q?+/jV4ew+zQ5/M5B/6zigkygNtEekRNeuKqxGBly0AP11vMQHoX6mvgeeCNvf?=
 =?us-ascii?Q?iX6UhFd4znIwclwjZRlFy/JZuyF1TbGZUrxTPHqcBYkK2rka0HFnw+1d3mho?=
 =?us-ascii?Q?a4OlSdzyCQrkqO/Ya9cWNzYf2PLxFz5vPBfRu6HxktPJQI8DFyA8jqPqwFEM?=
 =?us-ascii?Q?Fz1+CmQH5eiL0YWedBW9Cs7zHicD1BqwuPyj2YsS+XKURonx3k5cBOPLltER?=
 =?us-ascii?Q?IQmp+v2wVihzCVlVHsQ2gUvx2SatD9vfQvU90nrm/exMuZHNyPciFjXzez8t?=
 =?us-ascii?Q?KlDO5K0PBmtH8bIWsslgRqMCmSlFuY6Schn5lyvR8K9v4kRrKU7hO+8FZFkX?=
 =?us-ascii?Q?H5L0c9BDiLvkXGe90u2HOrlwVY9EMpTIijnZd3CJSSV/uPNkkRfLfikimWYE?=
 =?us-ascii?Q?FLMM7n58uzpyhJpLj/rektCeXIwpQ6I0OtmTDbsGQcFeXkgtYTQnfk/dek9v?=
 =?us-ascii?Q?Sqheo9yjB1jKwbU4Lt8i8yQMjLu8oy0JscqXD58p2JjQ8eHZERr+EtqEujTm?=
 =?us-ascii?Q?hSlY/HjT80ncgLYfJiRhufcJld8fRleENPFn6DLbPDQVswhLW9CJGoHnfp4m?=
 =?us-ascii?Q?1CSriImwYgkT1zbz/nzt1njDs1MtwlDnaCGp7oCoz5/ER1fRClknrciUMFKp?=
 =?us-ascii?Q?o/3xVW51wCzExPhEtPIJShiRe3IcKlo/p9dJwiW02H5dZg7QnlSsVXXjAR20?=
 =?us-ascii?Q?aST6rB3I3xkp4NBZDfDRz09Fsbp1taGUOHB0Q//IZk9d4FAMY0rxEuJTgkkA?=
 =?us-ascii?Q?8bLzA8OWOMugt+MbZCDQZDkFufn0Xx0c+EKvH1P56uxxX4F2Sko8ouCv7p1S?=
 =?us-ascii?Q?PU1Pek14NVsT8fMc1dUd/KTYBgXa+qoqSuVWaAIXMMxRpc909G/suqYPoZH+?=
 =?us-ascii?Q?ZTaeoXh1U4wxT2/C8mnfeUpgvSSQOcp1z0Dyi3AylEmZyV6RSDaxEknAocqR?=
 =?us-ascii?Q?cmr7EaGlwYKZT/HR921Eh8H+jhk1DEeGSqptLyCrgFWAvjgbL6RsTTXUpHev?=
 =?us-ascii?Q?CtBGuIQSucsqLDqa+USKI6Oy5RF6IGSurgraPbu3cmAGOcBtoawCugxWYOam?=
 =?us-ascii?Q?1CCnKKXldBplfsSG8r4nzs86TjTY5fyVkKeSrrbTzgVayqzC0N+caBqwqDmp?=
 =?us-ascii?Q?87h1M4Fxc3/hnCdMnwg/8sr0F5+RwlCkyFOnu7sOYB6xC8eXJsrz1mTPu3Yb?=
 =?us-ascii?Q?zqtbRZZT0R8MScwJ9ML8p0BG26YUfMXFjHGMUbO+VXCsY1B5eGK+YIQMv4iX?=
 =?us-ascii?Q?wCbwuXsVHzPSwKGDoMMiaIc2ScyBgv9aEhc8U/D9xzKigbCR2Oh5MVDD1Lmy?=
 =?us-ascii?Q?xQA/Mo7qFTrcuLPyjbFamebEAggeTu4gaPMgva8KApZHkk2eShQ6a2VOAarl?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TpVN8+8gxSNTGLyx2Q40FjcqZGR3TkrIH1vTBK+5y9/74uDeAe9ztwhyBq3a3YxzKGNf0UYGflZo3FcyajMkQJ+ay2/1Njil9Mr5+yfBgdqGuV1PdvBXkgpUVSdRxJN82GwQFlNNBZOkNp3CEIzcF1EuJRJXEkvW8rwd0nXedfzkkFIw9CZ5wRST0leAbVmb+y4Z0m1ueXwDOV6m2i8LLBaIAN+qnkXCstXFt4hQd2K6l+0ussnFnsVxlv5FGGuDlcUTUYGu66oYlKB4/7jb3XArE7VSWCsjEhOZH/I/6qJsmoMJBO8eIdNsTf9vY3xL+GLA7QmxcAaqpjw474Yr9tayU+m9Xyk73uziSUxSKiCK08j+vSqAjSF5QEF6QeIorZYSbUbdP2npNWnmNoLmCVNddOEZnbRijvJ+7jqfINFbOpoKJPRlWwOF/kWbt1r7oSijpru/X/EyetMVB00A0LlgDFtjjyeaMQmNG8DXb5P5NW0ixdq4oq+30JUq3cOSk5O90ZCSLb535QMQMjd9ArwdGbYmvnj+uRv2ZR2yQ9G0k1RpBbMvX+8Q7x1LtezNgPAaOnL2E1NUEG6w7MzjQWhOuMhGzd8hSVPjOkBOxDs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fc8cbe-8731-47e8-6c33-08dc6e003bb3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 19:10:46.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiIPQjThGmFHQDLKcZ6kgDjbAjuPb8ISofckaDgqhXyxQeinulg40foqAFoB62SooXJGwF3VW/67FRGsUP2Esw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7165
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=854 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060138
X-Proofpoint-GUID: 7wpXBRsakvQ2_rBSv2GeHW5K7w_kwGTo
X-Proofpoint-ORIG-GUID: 7wpXBRsakvQ2_rBSv2GeHW5K7w_kwGTo

On 6 May 2024, Kris Van Hees verbalised:

> There are small differences in the format of the BPF helper definitions
> in bpf_helper_defs.h in libbpf headers.  This patch allows mkHelpers to
> be more accepting of these differences.

... looks like it does that to me, and just as importantly doesn't emit
rubbish if the match fails.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
