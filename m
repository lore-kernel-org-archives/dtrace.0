Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD9229B18
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758131010; cv=fail; b=PwlEvwHvEH2URKlr3pSHsm3zUQaaN1J9RmOGWb66CRpW3dMRmh+8wDuXA0Cu2GrtUSh9gDNaAZOK2H7H/c+4MPn4AY+BnfGhaee4ya9erA/4nDtU1iNzpY93pR64Po4tnPn8Iiofzg83IhCB5Ts+462kgbLgv2fosvRFYUyhsIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758131010; c=relaxed/simple;
	bh=2BdMEPc0tq/n2yDOJhYhSLYB8aJlHwlbmEun+Vv5suI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d7WqE0KuIqN5OH8lYVmkCLp6X9DqSzotys1N3j+t70fji5nLH0lqGYx6FpAckEY5lFzETZnVGJiQzzAg5+gCfU+6/JughYF43+nOSPDf2IbsjJhfoYU+FkAO8B8mk6qcW2NFriva0zS9KT0SuRgsF4VEBRxoP5Fn1hciN8oR25o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I9CFYWvE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UmBJkpbw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I9CFYWvE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UmBJkpbw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEIVLr014280
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=O6vXvIn+SR9VHkceKv
	UCUzz3ngoTv1jrnUPjjau3Tas=; b=I9CFYWvEblQZD6E1Y6O0Ud3OnF77Haen/W
	WKDIgfFm5iJdbQL3gMt1dU4rByUJeZGvJE7CH9iAqnAlu700maYl2aGPOH8ghdfv
	+jGljKJt8YS9ADXMplgf3vkjHFE74h52n9GjbddhSd7BmSJnA62wHVLEseYAspln
	XlvC00folhfgA/aRliR6+3ePhmOZm/FyW7+xP1sSuWbcYekBDd1Yoobi+CrdC2Qu
	oR8STok2anG8shMDcLY4b9x7LyNV4PHNE9RmhdiqHB+Rn3ByYY2vsuVeV0MKDHVy
	Hfr4biBhRAggZN/o6AnTpTU5ayLbUfdquwUPdB+FoZKqeKjIz7CQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497g0k9wbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:43:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGYC3i036777
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:43:26 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2e45sj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJFNP0nfoP4rTbAHWca1ss9+pP9tOGS6baKz7nUlG0MyfJwIHepdqQMD1ipxgXJYxOY1cMRbGVMcNuoIAiDh0y6hYuct8gstnt/vHA8qJKVT6PHWZwe8nvQllKc/yX4L9uiIHCzON55HbhA+6p/sBSNS6MB8eM4shnbV4CkT0joH+FYu/VW25iSx9okIutppTFmFirZHoR82yCSY/pdKqFEgbxz350xa4nUrDFzKvN+qcaV5lyTLJWcJUm9bYVD2wa47MGdCG2SpJ8oL/h77nbYyuilsJN03NV7gQaSKsHP3ummAgqrLHLoF06V96e2Le/6LqDpxt9rnPxEMQ4+/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6vXvIn+SR9VHkceKvUCUzz3ngoTv1jrnUPjjau3Tas=;
 b=fVDAGgF5PfSszu1KjV+Gogm/KvMy8OJ/HjSdvErzTQJJVOy3Gcqh60VimRMYex40hV/UPcQoEAKui6GCUK/Sx+L+VIfwTSISicxGUvUCS1zOLZeVbXa97W7ZsAHMX8JgsWI2qB5WT7bFL7zWSe8o3n4IcgHuwmTf8wlURZcMmJySM7xhLxVL+COsdEfQxmQJhs3LKLcQ4dNCeYSHeABIx56fxhmB40WW5XnQLmVpBKzq9qb/cF+QDabxQqtMG1M59pyorVXgTgulpUBMiGrCI77czA5x0BrFU3K23jOD08UbBYroWopYxueHkvCMRawrEiQq5pvlRtTefAPEAstTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6vXvIn+SR9VHkceKvUCUzz3ngoTv1jrnUPjjau3Tas=;
 b=UmBJkpbwuX54qxpd29ma+fh73a37l00F5waJaMTUelv0QjF3FgH/jtTbHbDywiHNAC/MYduHHosVs7OYvm4GgEQ7HymuD11xPDei5OKHPBbw5O9W/PErOWnkCNrjazcWJ7Aej5pSk7O/0TRYLAGwXPqJi5fqkph/bdnjXzCEC0k=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB8210.namprd10.prod.outlook.com (2603:10b6:208:463::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 17:43:23 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 17:43:23 +0000
Date: Wed, 17 Sep 2025 13:43:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Allow probes not to attach if they were not "needed"
Message-ID: <aMrzOJRUSYNzBGIv@oracle.com>
References: <20250904190226.31242-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904190226.31242-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 936128cc-e72d-4211-5ea8-08ddf611b301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EySU1xk5FNtNfntpgqrhSf4Lqz/u4aV0LJp1GK4mWLbXClSc7j3m/xYLbVxc?=
 =?us-ascii?Q?R07u3SagpdqSi4R2iMaZ4XvWNZVFIsvGw7lICnkESmnsA2Ejjskae1kQ6dxu?=
 =?us-ascii?Q?UbS75sAtC724UhGkE6qEsz52Zeabmc8Si9Acl8Ac2LJAy7/f5I5AzaZMScem?=
 =?us-ascii?Q?3GZZyj50UZT9dHRptxE60UeHIjt+nMuz3u3mFRyiol4jEuCRXpmYTi+7kNUo?=
 =?us-ascii?Q?Dp+8MG1qAdd1NBlqxvOS8tOMKnHxpAUqnleAWTNvDorSqDsmZJ5fbp8RMi0O?=
 =?us-ascii?Q?xXOH+H/nQKCS49KnSqF8iUhuwbe52w0rs+bY1Why5W6uo4QpXU/keDHRZzMe?=
 =?us-ascii?Q?dC8IPFQCOY/4VYi+mdFxTShujXeiBWEyCKJas7zFxOdhClYzKufxX6st3c3e?=
 =?us-ascii?Q?tqIhz1KuXikO38vbahTIt6sHPjnzXdfczwySPVD/wqhkF9oM5xEPrDcbaG7x?=
 =?us-ascii?Q?KAWUTpjjWz+SsXxJ5i/ITvwzFvsRtyVfOlTkLsOWzB7+MM+1FjSbSibVGSPZ?=
 =?us-ascii?Q?wxOPu9J0I4bgSKErBkcdWzU+yYivBJ6JiHlkkMbYe1YS8yr4i/Wsbr6X2sXf?=
 =?us-ascii?Q?TxuZ91SsfKcsRcSekT4Dpby9cA8jEoXFocH52aoZHx/LfeVLUSWLsRTX0tet?=
 =?us-ascii?Q?7GL0JN1trDb6o6rdotdL3OBsmYlkwcUqb1n/VIjPGxjXRDdEFE5B8CZYp6iu?=
 =?us-ascii?Q?7E8MoH+aBVPwOL0p/MrFUAwpIXZOE8CMutabN8RFhvU7TpywZBK2SvroW+UA?=
 =?us-ascii?Q?cK3aT9p34KvP39lUNqtfkbCFfCo6bfysoYkLOaOOCop9n1K8lerfqmviHSC9?=
 =?us-ascii?Q?pw30+7V7QZgnwWKuJb2netR+qr0FYgoX5VH98h7ME5+LVhBg2pbn0YtIictN?=
 =?us-ascii?Q?YPirYO+fNurvm/ZSr2Xfj162lrxCQ8/H8G2EAq9UF7fWBSMsXWUE2wMbIVK4?=
 =?us-ascii?Q?65nii/FMWUeL7BnC9sr/hbVNu4trLd0/FXS8FLrtQS7Dsrl39TFB6FZ4MH2N?=
 =?us-ascii?Q?OsNYHFqROXbrurBgvglOO78mSYFvqWWBj4aIFDULlbFwtA+etR+hyD/y3h8/?=
 =?us-ascii?Q?DkWy3eq73oqwRCpEiWl0DsyHRFNb4u1LsoClljxpo2RDhlg3qYPu2eI3k42i?=
 =?us-ascii?Q?HFCF8weEU/DJZxwC00Va6cNLMYBY9HQaaXpFde1Rf/shk/fNw84A6HZsYOs4?=
 =?us-ascii?Q?tds4gKSJth94t2rTKPh7wKmkT3l/Fz/xxMYdYoB3ppiBSvPHwdPPGuctbrGD?=
 =?us-ascii?Q?y7NoFcfQAGcC/4pkS3IbYL/XlgDzFthn7pnTq/mP8ntRPE2mVUIh4pxcsxjo?=
 =?us-ascii?Q?LjM4JV+QuGcBzZUtiazBzM/IWhWsaQ708mGQUTw41ZLOJW55OreLRu21ue96?=
 =?us-ascii?Q?pqzpNvhLx3ARovFgdHxn0PMJmQCpfWsqXXWrQkO/Zcf8HSHoh1bqSu/dT4ia?=
 =?us-ascii?Q?OVjdiAEcjtg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a55M78iOieD993n5niJC9TmNJ9Ee8GWuuKGVaLBYMeQ+ZD/BfT69Xaqpe60y?=
 =?us-ascii?Q?sxcylYcgMdv2XFCnY4gW7v5PP39gA6x7YBWDvrJCP2fAwucKPmlJNNc12Dr6?=
 =?us-ascii?Q?rO4mWYg2cQNaMCLmtrFadMTlZZ1hJOgjp3PPUv4d0foP8GrQfF0qHzuaE+2T?=
 =?us-ascii?Q?tuWFUhVW8mTQGHU1Kkbz4PZ3IUT/7zqW8dRM7eFUhKyas/Xuu48pe2uThHKJ?=
 =?us-ascii?Q?L+2Vas7KtZE7LtnrXOmzLTFwjH8MwsnapHoRWC1xssu9GDQbuDA4e6wMf+NB?=
 =?us-ascii?Q?qsE6+Gumq9YL4REUH2D7rFg51NrzyHdCNVfWtdAuK9X98WmNtGRIb6tqVxtB?=
 =?us-ascii?Q?yegT5BPDJFcvBoV5zu8bZumqIpXgL8pJeAymA4uqhIuxoeE7TBhzPeI0HtYA?=
 =?us-ascii?Q?Ie/9ADebrlpNNQJXHgkU3HG27whjZ13q1XxpEeFlwq4oHuYtKq0w++FaWUhH?=
 =?us-ascii?Q?mGHuH5C+Mnb1VixwvnnRnGs1zzb2UtK7Ry6PUmXt/n0mZSYxJmvoOrVPw6/v?=
 =?us-ascii?Q?xiKynWSJFE60fdfz4ioKwQm50BdD6rSFUAOaHotH55ixvlzxPEdl8FzFiyQp?=
 =?us-ascii?Q?pzyAf2HaEG9cRrqsuaDLKvZ1+eW44NmFPTLWhZvOwbSesBWlTb5feJ/WRbNV?=
 =?us-ascii?Q?dqUMxD+GiCMh1TfCF2f1ZY24SoYYqm3YEnCot726UOKArig+smDhxekm1bag?=
 =?us-ascii?Q?aydGFIYAHO3XP00P17zw6bUGRBgYuplOu2JqXQL6WeFhjaLIJFZ1wYktBOfk?=
 =?us-ascii?Q?0bR6fZT/5+Jo0pARvEsQ6aQsrBT0OvpBmqfkiJIXTy1JshnpgXONiuDoY5qo?=
 =?us-ascii?Q?aLo0rFhggzyjVCtTaoYfQj3Efz0HAu7VT3FN8VuXId0LfTdigYTHUjbD/DNq?=
 =?us-ascii?Q?dITEXIndEPk4RbzJrZRCN+BCVYX+svm7NuWGFqNY6EsIoDbKZGy1okJ0wDMQ?=
 =?us-ascii?Q?zIZbTXQ1e5hfE3vVGS3ovAbcIpzP4327UUJklyOJYDUXKz67BplpxqryY5ZT?=
 =?us-ascii?Q?+z6MtHT7hG1Rb/mAbtqurp6V/3l5Jc6ICY/acO+s75OO82gJk7uPPbJuw239?=
 =?us-ascii?Q?hiPVfPNp/NZcSiZc+LFwBWqX1HLdUyR9Q+mr3KECKRs6EQ78N+ctOEFgkLn9?=
 =?us-ascii?Q?SegAANeH4ObE2zJCqgYDrO1rzouz4Bb3OZ7T2y7pt3qFHDYJEZDQy81u+/EY?=
 =?us-ascii?Q?x0+kFkaFvq9Ba+N/P615mkeotbGmNRiLMPnbUcTslqkelTRWoiQqjO11rDu0?=
 =?us-ascii?Q?AVKVn5usUfNrWV/xM1tOEZlb0t9Vud66NycOarKd0zgXCpaX+MkRzmIq3+wj?=
 =?us-ascii?Q?IwfeCUL8uhudW1DtHtODsp4euOcxn5n96RruIg0/O/WGseI5kO7KmJXJ3yuk?=
 =?us-ascii?Q?goYpNhPo51ZDPKQ0CqR7VFE2lv4YlC6MFR3CaLCaqpGyrFXzNlBX3u/Vv20H?=
 =?us-ascii?Q?BX8rnOt63WyPQddc+6fhEqisRklzNUuP25hj5fL2+IDqkShE5nv2IyoWW6nS?=
 =?us-ascii?Q?donXm2UnB2dYG6SVfQ9Tm5RsBPDpoeXGOI6yg7etoTpIrr4dzLVm4BFWNq5H?=
 =?us-ascii?Q?pbUQ9RxhunTGy6o16RGBVGJvVtoVGXypW8iQHGMzxHFPKht+al2ej6Imq/wS?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BENN7lKMX1xz6PCMEfOOCzN3tqv/c0jfVR2kmKVHPyScYlRlnipkXRuMiQWHpiExJ0q9LxxqIDfo1vAhb04y9rJFl1q88PnI9BPNTa6nwe6sXyqoWUND91DTx9JhXeo0f7Q6yqg2k4FZxao+qtymfh9T1hxKiTkhYfEbWeflNio/35RExECCgWucrIz67GtO69NJAhTIfTE/fSLGOo64TrWaqfEZSlS8DAWzEQpFyW5tsNYZ/HXKHWRXGyGelCV7Zb7iSFW+qpCGOdV8e1LdCBne03Vwzdmin3CoXlMeNbzJ9duThnN9rfAL6RYVJeybd0NZHK7UJumKHt+swbHK8oE1BSMmYT9GemUswiZregcWbrGLOS3vxWkGWJwH8iWN4AkW+R2dBmqfXqIlqEPpt2IMNzchNK9cQdGj8iFQ3UCMuhXb00cNEBUmv6L1TI4p2pafHvo1g4LeoYtWnxXNXtteG/ChkwWm32wFZFUk6WRT5I+jhlX3UXcDCLuRZyYYJ1wo6X9LTklPIee9LYVX2Ulz2qhwiYRWpGD8JoSm6v28xwyQR5yIQiwIh20lDxpWzbfjprS+02SPx17XmpjuxEONvXxZsTEg6/cN26V2Hjo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936128cc-e72d-4211-5ea8-08ddf611b301
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 17:43:23.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQJ2OwRfZBA+CCTeEZrKITg2rTb54AKhaPkrpwxfP0TNXMA+hIUkeKcPJyXxTN3o/mdTcxOz6D1dIxe00PD4WWElMbQuzUIsEHAxnHaXM8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8210
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509170174
X-Authority-Analysis: v=2.4 cv=b9Oy4sGx c=1 sm=1 tr=0 ts=68caf33f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=mg0B752aUliAfR2vQOkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12084
X-Proofpoint-GUID: -ebNcDHHR9B2NGgAOjg-l69r-5WHXl47
X-Proofpoint-ORIG-GUID: -ebNcDHHR9B2NGgAOjg-l69r-5WHXl47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMyBTYWx0ZWRfXxXp5JHrrfx7u
 05N9Cd8KJhsWa6ke91YgTo6XOa66pCXdjYHX9Iq8pJ2/qfaNfKJO2eYmulhxkpikRxIhjpIyTEh
 gy6Rn4xvhB1NcH27ahc2bDnpKScEcC53QGuRmFlh6YgJ3rfmQUarrY4F6Lw26XTiM9qpOP0pW2K
 gnGiSCtWN8g8qivfsrkGXdBSPK+7yDdkQlADKGvwndEhz/R/BDvvkMxKA4ar7aaji5ykG02sDpm
 5uuaEjdH5aJpiZbVdXbWGWpN67I8ROtcY5a5ZWSYB5KQe2ryd2oBJpl1aiFGs6r+pmtagmoRaeC
 +KJR+3nmlhCGTo1L+brisCCBweoyCwf9yLMuZNvF4G0Dx1+lOec+eaz+fx/cr2H4lvkgn/2QVbB
 KAum8fgGiS0YvGO+QuOn6seaBnWdfw==

I think this is actually counter-intuitive.  In general, probes are expected
to be able to be attached to or else an error is to be raised.  There are
exceptional cases where a failure to attach should not be considered an error.

So, I believe that the implementation should by default expect that failure to
attach is an error.  Introducing a flag is certainly an option (though I would
expect it a flag to mark the probe as *optional*), though another approach that
might be worth exploring here is to introduce a 2nd list of enablings, named
dt_opt_enablings, and add optional probes to this list.  That way you could
refactor the construction and loading of programs into functions called for a
given probe, and just loop through the mandatory enablings first, and then the
optional ones.  That avoids adding a flag and also differentiates the two types
of enablings explicitly.

On Thu, Sep 04, 2025 at 03:02:26PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Various kernels prevent the placement of uprobes on particular
> instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
> autiasp.  This means, for example, that one cannot place a pid probe on
> every possible instruction.  If a user explicitly places a probe on a
> forbidden instruction, an error message indicates there is a problem.
> 
> On the other hand, if the user specifies a wildcard in a pid probe
> description, we should skip instructions where no uprobe can be placed.
> 
> The problem is that we do not find out an instruction is problematic
> until we try to attach, which is long after probe descriptions have been
> processed.  And when we walk probe descriptions, we do not have
> information about which kernels and instructions are problematic.
> 
> The motivating problem pertains to pid probes, but we would like
> a provider-agnostic solution.
> 
> Introduce a "NEEDED" probe flag.  Set the flag when a probe is explicitly
> needed (say, it was specifically named).  We use two such flags:
> 
> * In dt_probe.h, DT_PROBE_FLAG_NEEDED is used for the "flags"
>   member of dt_probe_t.
> 
> * For pid-style probes (including USDT and stapsdt), in
>   include/dtrace/pid.h, DT_PID_PSP_FLAG_NEEDED is used for
>   the pps_flags member of pid_probespec_t.
> 
> Set the "NEEDED" flag for a probe in these situations:
> 
> * In dt_tp_probe_insert(), set the flag for each probe we insert.
>   This covers the dtrace, fbt, rawtp, sdt, and syscall providers.
> 
> * In dt_sdt_populate(), set the flag for each probe we insert.
>   This covers, e.g., the io, ip, lockstat, proc, sched, and tcp
>   providers.
> 
> * For the cpc and profile providers, set the flag for probes created
>   with the "provide" functions (explicitly requested by the user)
>   but not with the "populate" functions (chosen by default by dtrace).
> 
> * For providers that will sit on underlying probes, set the NEEDED
>   flag for pid_probespec_t.  Specifically,
> 
>   * In dt_pid_per_sym(), set the NEEDED flag to cover entry,
>     return, and explicit offsets.  Unset the flag for glob offsets.
>     In dt_pid_create_usdt_probes_proc() and dt_stapsdt_parse(),
>     set the flag.
> 
>   * In dt_prov_uprobe(), pass the pid_probespec_t NEEDED flag
>     to dt_probe_t, for both the overlying and underlying probe.
> 
> In dt_bpf.c, if the return code from the attach function indicates
> failure, return a failure only if the probe was NEEDED.
> 
> Remove the old check on "hlt" instructions, since it was not sufficiently
> general for other kernels and other problematic instructions.
> 
> Existing tests that expose the problem are
> 
>     test/unittest/pid/tst.coverage.d
>     test/unittest/pid/tst.emptystack.d
>     test/unittest/pid/tst.entry_off0.sh
>         hlt instruction on x86
> 
>     test/unittest/pid/tst.float.d
>         multi-byte nop on x86 on newer platforms
> 
>     test/unittest/pid/tst.entry_off0.sh
>         autiasp instruction on aarch64 on newer platforms
>         depending on how the trigger process was built
> 
> A new test is added to check that a probe set explicitly on a
> problematic instruction will still lead to an error.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  include/dtrace/pid.h                   |  3 +++
>  libdtrace/dt_bpf.c                     |  2 +-
>  libdtrace/dt_pid.c                     | 10 ++++------
>  libdtrace/dt_probe.h                   |  3 +++
>  libdtrace/dt_prov_cpc.c                | 10 ++++++++--
>  libdtrace/dt_prov_profile.c            | 10 ++++++++--
>  libdtrace/dt_prov_uprobe.c             | 18 ++++++++++++++++++
>  libdtrace/dt_provider_sdt.c            |  8 ++++++--
>  libdtrace/dt_provider_tp.c             |  7 ++++++-
>  test/unittest/pid/err.needed.aarch64.x |  3 +++
>  test/unittest/pid/err.needed.sh        | 23 +++++++++++++++++++++++
>  test/unittest/pid/err.needed.x86_64.x  |  6 ++++++
>  test/unittest/pid/tst.entry_off0.sh    |  4 ++--
>  13 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100755 test/unittest/pid/err.needed.aarch64.x
>  create mode 100755 test/unittest/pid/err.needed.sh
>  create mode 100755 test/unittest/pid/err.needed.x86_64.x
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 8ddb1167e..7829e47c0 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>  	size_t pps_xargvlen;			/* (high estimate of) length of array */
>  	int8_t *pps_argmap;			/* mapped arg indexes */
>  	char *pps_sargv;			/* list of arg sources */
> +	int pps_flags;				/* flags */
>  
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
> @@ -55,4 +56,6 @@ typedef struct pid_probespec {
>  	uint64_t pps_nameoff;			/* offset to use for name */
>  } pid_probespec_t;
>  
> +#define DT_PID_PSP_FLAG_NEEDED	1		/* probe is needed */
> +
>  #endif /* _DTRACE_PID_H */
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 31781ac9f..dc3d47f56 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  		if (prp->prov->impl->attach)
>  			rc = prp->prov->impl->attach(dtp, prp, fd);
>  
> -		if (rc < 0) {
> +		if (rc < 0 && (prp->flags & DT_PROBE_FLAG_NEEDED)) {
>  			close(fd);
>  			dt_attach_error(dtp, rc,
>  					prp->desc->prv, prp->desc->mod,
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 4af9141aa..6e7fba287 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -184,6 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	psp->pps_fun = (char *) func;
>  	psp->pps_nameoff = 0;
>  	psp->pps_off = symp->st_value - pp->dpp_vaddr;
> +	psp->pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>  
>  	/*
>  	 * The special function "-" means the probe name is an absolute
> @@ -386,15 +387,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  #define disasm(x, y) 4
>  #endif
>  
> +		psp->pps_flags &= ~DT_PID_PSP_FLAG_NEEDED;
>  		for (off = 0; off < symp->st_size; off += disasm(off, &disasm_info)) {
>  			char offstr[32];
>  
> -#if defined(__amd64)
> -			/* Newer kernels do not allow uprobes on "hlt" instructions. */
> -			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
> -				continue;
> -#endif
> -
>  			snprintf(offstr, sizeof(offstr), "%lx", off);
>  			if (!gmatch(offstr, pp->dpp_name))
>  				continue;
> @@ -1064,6 +1060,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			psp.pps_pid = dpr->dpr_pid;
>  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
>  			psp.pps_nameoff = 0;
> +			psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>  
>  			if (nargv) {
>  				psp.pps_nargc = probe->probe.nargc;
> @@ -1421,6 +1418,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  		psp.pps_inum = pmp->pr_inum;
>  		psp.pps_pid = dpr->dpr_pid;
>  		psp.pps_nameoff = 0;
> +		psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>  
>  		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
>  			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index 2a78cb9ca..ffd994844 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -53,10 +53,13 @@ typedef struct dt_probe {
>  	uint8_t *mapping;		/* translated argument mapping */
>  	dtrace_typeinfo_t *argv;	/* output argument types */
>  	int argc;			/* output argument count */
> +	int flags;			/* flags for the probe */
>  	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
>  	dtrace_difo_t *difo;		/* BPF probe program */
>  } dt_probe_t;
>  
> +#define DT_PROBE_FLAG_NEEDED	1	/* probe is needed */
> +
>  extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
>  extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
>      dt_node_t *, uint_t, dt_node_t *, uint_t);
> diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> index 57b11b135..9fb165cb6 100644
> --- a/libdtrace/dt_prov_cpc.c
> +++ b/libdtrace/dt_prov_cpc.c
> @@ -347,6 +347,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  {
>  	dt_provider_t *prv;
>  	struct perf_event_attr attr;
> +	dt_probe_t *prp;
>  
>  	prv = dt_provider_lookup(dtp, prvname);
>  	if (!prv)
> @@ -358,17 +359,22 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		return 0;
>  
>  	/* return if we already have this probe */
> -	if (dt_probe_lookup(dtp, pdp))
> +	prp = dt_probe_lookup(dtp, pdp);
> +	if (prp) {
> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>  		return 0;
> +	}
>  
>  	/* check if the probe name can be decoded */
>  	if (decode_probename(&attr, prv, pdp->prb) == -1)
>  		return 0;
>  
>  	/* try to add this probe */
> -	if (cpc_probe_insert(dtp, prv, pdp->prb) == NULL)
> +	prp = cpc_probe_insert(dtp, prv, pdp->prb);
> +	if (prp == NULL)
>  		return 0;
>  
> +	prp->flags |= DT_PROBE_FLAG_NEEDED;
>  	return 1;
>  }
>  
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index e1369ca9b..ec32ce83b 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -160,6 +160,7 @@ static uint64_t get_period(const char *name)
>  static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  {
>  	dt_provider_t	*prv;
> +	dt_probe_t	*prp;
>  	int		kind;
>  	uint64_t	period;
>  
> @@ -176,8 +177,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		return 0;
>  
>  	/* return if we already have this probe */
> -	if (dt_probe_lookup(dtp, pdp))
> +	prp = dt_probe_lookup(dtp, pdp);
> +	if (prp) {
> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>  		return 0;
> +	}
>  
>  	/* get the provider - should have been created in populate() */
>  	prv = dt_provider_lookup(dtp, prvname);
> @@ -189,9 +193,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		return 0;
>  
>  	/* try to add this probe */
> -	if (profile_probe_insert(dtp, prv, pdp->prb, kind, period) == NULL)
> +	prp = profile_probe_insert(dtp, prv, pdp->prb, kind, period);
> +	if (prp == NULL)
>  		return 0;
>  
> +	prp->flags |= DT_PROBE_FLAG_NEEDED;
>  	return 1;
>  }
>  
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 07b26f20f..2396522ce 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -960,6 +960,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	} else
>  		upp = uprp->prv_data;
>  
> +	/*
> +	 * Pass flag info from psp to uprp
> +	 */
> +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> +		uprp->flags |= DT_PROBE_FLAG_NEEDED;
> +
>  	/*
>  	 * Only one USDT probe can correspond to each underlying probe.
>  	 */
> @@ -1049,6 +1055,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	/* Look up the overlying probe. */
>  	prp = dt_probe_lookup(dtp, &pd);
>  	if (prp != NULL) {
> +		/*
> +		 * Pass flag info from psp to uprp
> +		 */
> +		if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> +			prp->flags |= DT_PROBE_FLAG_NEEDED;
> +
>  		/*
>  		 * Probe already exists.  If it's already in the underlying
>  		 * probe's probe list, there is nothing left to do.
> @@ -1091,6 +1103,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  		return -1;
>  	}
>  
> +	/*
> +	 * Pass flag info from psp to uprp
> +	 */
> +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> +
>  	/*
>  	 * Add the overlying probe to the list of probes for the underlying probe.
>  	 */
> diff --git a/libdtrace/dt_provider_sdt.c b/libdtrace/dt_provider_sdt.c
> index 962848485..f9a51fa25 100644
> --- a/libdtrace/dt_provider_sdt.c
> +++ b/libdtrace/dt_provider_sdt.c
> @@ -48,10 +48,14 @@ dt_sdt_populate(dtrace_hdl_t *dtp, const char *prvname, const char *modname,
>  	 * entries to identify the probe names.
>  	 */
>  	for (arg = &probe_args[0]; arg->name != NULL; arg++) {
> +		dt_probe_t *prp;
> +
>  		if (arg->argno == 0 &&
> -		    dt_probe_insert(dtp, prv, prvname, modname, "", arg->name,
> -				    NULL))
> +		    (prp = dt_probe_insert(dtp, prv, prvname, modname,
> +					   "", arg->name, NULL))) {
> +			prp->flags |= DT_PROBE_FLAG_NEEDED;
>  			n++;
> +		}
>  	}
>  
>  	return n;
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 3d4ec1e03..4531a88a8 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -368,12 +368,17 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>  		   const char *mod, const char *fun, const char *prb)
>  {
>  	tp_probe_t	*tpp;
> +	dt_probe_t	*prp;
>  
>  	tpp = dt_tp_alloc(dtp);
>  	if (tpp == NULL)
>  		return NULL;
>  
> -	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
> +	prp = dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
> +	if (prp)
> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> +
> +	return prp;
>  }
>  
>  /*
> diff --git a/test/unittest/pid/err.needed.aarch64.x b/test/unittest/pid/err.needed.aarch64.x
> new file mode 100755
> index 000000000..bd5b41a36
> --- /dev/null
> +++ b/test/unittest/pid/err.needed.aarch64.x
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +echo "skip on aarch64"
> +exit 2
> diff --git a/test/unittest/pid/err.needed.sh b/test/unittest/pid/err.needed.sh
> new file mode 100755
> index 000000000..d6b041b60
> --- /dev/null
> +++ b/test/unittest/pid/err.needed.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# We should not be able to trace on a hlt instruction.
> +#
> +# (When the probe is "needed" -- that is, explicitly requested by the user
> +# -- we should incur an error.  Test tst.entry_off0.sh should be okay,
> +# since dtrace will silently skip over such problematic instructions.)
> +
> +dtrace=$1
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
> +
> +$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off'
> +{
> +	trace("hlt instruction");
> +	exit(0);
> +}'
> diff --git a/test/unittest/pid/err.needed.x86_64.x b/test/unittest/pid/err.needed.x86_64.x
> new file mode 100755
> index 000000000..158336d98
> --- /dev/null
> +++ b/test/unittest/pid/err.needed.x86_64.x
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
> +    echo "did not find hlt instruction in trigger"
> +    exit 2
> +fi
> +exit 0
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> index 1a4c3d207..304be4568 100755
> --- a/test/unittest/pid/tst.entry_off0.sh
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -1,14 +1,14 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
>  
>  # Although the D script takes only "one second," it takes a long time to
>  # shut down.  Until that has been solved, increase the timeout for the test.
> -# @@timeout: 120
> +# @@timeout: 240
>  
>  dtrace=$1
>  
> -- 
> 2.47.3
> 
