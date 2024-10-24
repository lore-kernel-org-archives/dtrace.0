Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E191FC7F7
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791795; cv=fail; b=nI6W5dbMV8rjlMOg+qutipOqC0OOAuIJF8GZ6mGoLPmKIX1k7PSziwP31bZwI/itZYgnUeQlxYA6Q3IIIj13K7ClgtBIwMVgogp1Zw1pBwmxd7xsImEzEnSfuDj+O62tbyrGQB6qtpr8C3KlYEMsKLoLwB9PN1vv2Gm/pLDCt0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791795; c=relaxed/simple;
	bh=IC6JyLQ7AY7geZTBKa1DMQMucXq+D3cwZ/46nTStxlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X8rTeIim/z0gXiz7Q03eqAY8BQGJbpz3Wk0kXI7R1t8egAnQDldL0vV2WtjGRgohfLj/RUTBQ6IVoxtaJpGyyFws0ChtxeGDQTbVvcBmZfhba2Zd6Tv8P0O4bTs8+lp+BcUWIEPT2S4z2PpWvoAQ/uLyGKQzI8cs3gMuqCUfTjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ERClfByx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pATYqrzi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ERClfByx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pATYqrzi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGtmOZ029269
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=QX118egyOieLdzVRw0
	HqeZGx/agmn7MRzwrlYapvFaY=; b=ERClfByxwMOSaDP75iduZV0POaqr/c+LzJ
	/GIwmLvSfi4qFSTzGstY3Tt+UI39LaN9lo916gzp49qGdRpqkedVoyBWmjpzPyzF
	sfsZU4o8nBYXWFxVEYxCo3v6I3Ofgo4FbCiSpHJP2EKT7Us65pi80zwp6IWpOGm8
	rzEqKfdUJt2aVboYMG8elkwR3E8SDHOPXYL/eOLD69W4PeMnZDQ7YPBWlkFJ/D/7
	xzDKJENSvov7+Jq+rY5QhHg0CUQdI+f60LgI0iaO4CVOITJM0tzfHQ6xHrkfvDxg
	PA7Y3dC4DvugfuA+tbgH+DJuqC9GBduxLHZV+UkXsRGOJsdvDRiQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uu83x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:43:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGwfk0039589
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:43:10 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhcu93m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd9vsHEXaPFnL/A5B2KABW73oZe72sHJNDf3ae/Lf5T9j1WsbPwWD8ng5hlAWR4cTBYk/F4na9gteHr6tQN3tWBmj5E0QNNIBFNjhBFiMIMZsxSzdvUodljCpvl6Xu/4yzZu+IqFyHmYXvD8v1R32W9MQb5BOO5MYRDEg0vsrfE+P+xXYlYcBqXdJxBd84fjPo5UN3EObO03fZvOQ/mvmQbwPNdBrZnEQB8Yc2yrwpOZYUVMLn5Ypb8cUHU3A7grIlTyttJUITSPJt1uo6spfQeydOgVE55qqx6iDa4t2FuS2GVmLQ+aElUJrxRfJ9dbyKV6TmJA+30Ldd3KzkzH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX118egyOieLdzVRw0HqeZGx/agmn7MRzwrlYapvFaY=;
 b=cPfgTyWE7O5dSaS/o8a1mqNbQZYHX7vuU2DbYCWCW8Ia2axc0kvJagKGW8QGeYxCEAJ36xZToq+XnKBeO7KnL7Yg8fssiwH1f86uYT79P5G2DXSUBPKMvH7+n7czxXbnRmsnc2YMwHzGkp4s9+Ep+rssoUgFxxkRAf0hVpQcniwOyvdwWudBGAuDLG8ayA1Kv9EFGI98LqbYnZy3vBAkws47X1E5gO0+gnOp7FaPJs0MQcx9S1HWGjvzGKVk/U6OPUlzBOhufYmnRjiDgBTt7Nm6PZRxwIcIUuYRZUPOjR9YqFMdbWsNUuueISfHNaZ4uMrPRivbrbdZoNUdbaZ1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX118egyOieLdzVRw0HqeZGx/agmn7MRzwrlYapvFaY=;
 b=pATYqrziBfk45HUMyPEzDmaaeJRyaQBv7CiY5LIEZjafBREmVkGjtUphaNAeoMwDWCaaAhViplCqprGnWnvkkKJmeqLso66E0BVp95UPxoatDVHooGzFeSnCm85x5QLurqpHwtePNeHmpv2TXTyZBZpkKf3C6ysNpBXSPpVmATw=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH8PR10MB6360.namprd10.prod.outlook.com (2603:10b6:510:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 17:43:07 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 17:43:06 +0000
Date: Thu, 24 Oct 2024 13:43:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 19/19] test: Add another USDT
 open/close test
Message-ID: <ZxqHJVSTO4Hp0Vs6@oracle.com>
References: <20241024172143.14091-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024172143.14091-1-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH8PR10MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e36b77e-7e07-4a6d-960a-08dcf4535169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rta7oC0HicoGGYKv23S1Mu8RW5Kr83CjIbwqBsSqnGEG0My77f1Tk/ZiwakH?=
 =?us-ascii?Q?1VIoIZKpho34askCBb85Lbz4KVHnLNOO5lOjPZWIptlj35RTYkoATFR06usf?=
 =?us-ascii?Q?nEGlyN4tvOkcxQN6uJUpGSMjGTjabMiKmY7zadvWW1017yW6xBFB1/4ELr54?=
 =?us-ascii?Q?+1vo853a1jW3abzfiNMFSSAS+ZnSz/ww95FHizVlyPP4XqnGEAJjaGPJrFz9?=
 =?us-ascii?Q?Dkvt4LYT5YNR612AfFui/KLH/OTu5XgPdhLz5ol2vIlUchvh24KAMkX0U9mZ?=
 =?us-ascii?Q?e3o5ZVlWFH0W7vfxvH7LkomAnncpRLG+fjz29QfskkzIxaVjB/n9Su/cj5m2?=
 =?us-ascii?Q?yD9/DJx5qEVu5sHMaJLCGT4yNrKjYGAYJIBQBOcCCAu0X8M2A78IBr254kki?=
 =?us-ascii?Q?owNDJvfMuU9xzml5c3q0rY7c1jy8+InBmcCEDdRX/jF16uvacGPcpAUjAG+b?=
 =?us-ascii?Q?JMDsoUZ/JsHjF5n0sBq+8CqOQnTCtpgSC/SSuoRJ1yDqGT3aYbxn/0iZnnKl?=
 =?us-ascii?Q?77VZ+Ox3TGe4t7hxFr5fmGPlsN1kyJ2mXXwa9CIQM3C6Pa4ExLQiLV5nSwgX?=
 =?us-ascii?Q?T/G1eew7xo7YmpcyCNbStdr1AxMCjGCVa5ds4LLyrKn2x19Mq211rkeDgxSe?=
 =?us-ascii?Q?LjKETLjJVGwZPBGNLr2wNhiMRbG04Hc10OqOxnJAoH8MZthMiFByUmBBKAKA?=
 =?us-ascii?Q?WgFgvAe3G3IKNCbNy/JrpLlypCa0nrSB/V3YKa0g///npthttAB/KgM9M/7K?=
 =?us-ascii?Q?oi75S7kshR0CxmqNaYOgTfHRrxiD1yffOtnk7JRGBSywnifrCImOaQaCKuYM?=
 =?us-ascii?Q?H+ytXBXkdW6auOvfa4H2VSqrt6ODOjs54fiHEYO/poDJEXoHq43DGJyfk5hQ?=
 =?us-ascii?Q?rZX9lQb6F36zig+fdeUOFyMvJjQHWK9LQUg9vtl85K21kZygxxnrffriV98J?=
 =?us-ascii?Q?3TZoNCypgaj/jLOdKQNLN1zAn1dAiggKx1zjqRfryZarVmCNdEZJ/fR33Q4o?=
 =?us-ascii?Q?j/+LEIOzrJeQUjwsJTmq+OWCInniPN/J9vuIB0QoO6JlX04RyDbOf/ASPBwZ?=
 =?us-ascii?Q?CwZV04GnZINYeQXJKjmwDtbwxbK995qsHlbaWT8NYaYFFIvnONJzF/Yaty+z?=
 =?us-ascii?Q?NL8/gXm+9wIuc6aEkRcb+ilpYFmgUefdh6oAIwKi4+PuebvV1oEY2xxKHn/Y?=
 =?us-ascii?Q?G3DmNIDObPrApKUS0CapsX8C2bUp1J+POFmTj+WRg/7w/3E2mcUnTRs2VvVh?=
 =?us-ascii?Q?f5GmnQZcBVkhGRWj0CJXw4bcHWkzIqJxZkQnN70RYe4Eis8otSnuU7ESpEle?=
 =?us-ascii?Q?loViwHzC/ZlwF7YEnk4U2Q7Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dlGI29Vn0XURP/JWQo1HGScU6MGL0Z0+YxpO+Z3kFR90GzISSTIbKmOd4RaQ?=
 =?us-ascii?Q?K6puVqN26yYY/agIOcjCnXcKbsRPx97W/B/PVqe4w51ia5fLTBaMfsOaiI63?=
 =?us-ascii?Q?PxbvuFI63hERQJNxnXn/JY4g1hm2lT9BnN2VfwmaTE5gJbmPFGmkkm7dwxev?=
 =?us-ascii?Q?fuFalLn0rre5SCzq5KcVfWTlyO0oEWeTDMqRMNvyggsZ3giuNIxfOk0Pb5dw?=
 =?us-ascii?Q?kprkOhz7S3Tofq93BWOAC4CNVhbVXsJ9mdS9lBLQCfkgfJcU5/KZEp4SoN2u?=
 =?us-ascii?Q?6lkIZi4+fp+Gl9JnsbSxU6ViD0/RarWS/EI+2CMhlaTpmxo7pmtcdWhTT06R?=
 =?us-ascii?Q?3YC1WMjo/jU5sQNnzO21f+I90Aoeuu4MrskwcOfk3W86ps8+TZ24Agba5su3?=
 =?us-ascii?Q?ju6mV3XZxFCn2xMX5nEO3XLNo8OjLwsCzXTDBVfi5V3ryeagmUsTzAJEr9Ta?=
 =?us-ascii?Q?XU4oQ7g0Cgn8GmybMueTTLJHT3z8wU1zwd9WQKse6hJURtr15i4hFANu4QjO?=
 =?us-ascii?Q?Ux1RDzeiskX7dAGC6wk1bpDai58/5VRnU2LeI82N/oALYBRKdGS9+0SMrIjy?=
 =?us-ascii?Q?wcODXQKCof9hjT6qrLOZxCE3aUo3VIDu48XqeLMbG+xaGv8vdWjaWO0SYOfL?=
 =?us-ascii?Q?io8Zs2EgUHlmUPLUroEKjhsw6S3AKjMLxwan+0DfV0qaNdOum/cKez23Nx6B?=
 =?us-ascii?Q?BMxz7zIF4LHhYKYmImrJ701N0JX0y6Vm+fiVXvJWydSwyzdfIpwc69w/qZkT?=
 =?us-ascii?Q?rB+VdRFOde2SSHwYtLvNEHaJKYWlYqc9Yjx0HyopSFPaMWu492oWrWs5ssaF?=
 =?us-ascii?Q?CRuNYghM9GYJpR60lDvitpn+5JIhxhJkMy1ANpXwFpeg4kcGzKKYwpRN+rsD?=
 =?us-ascii?Q?Wc65XyHQ8C+h0p5AHo4v9IyIXm0SDim7x3g8hFsfw10GvWEEgPWdZBsxaQPr?=
 =?us-ascii?Q?mTm+kylxNyykjpAF0ikJtzuAkeTDVdqjKYlmqaZTbFZXYntZHFboTunoU0OF?=
 =?us-ascii?Q?pd1kzMNk+jbYaGrMGPNxY2o7AuOa8egA5AnEIXyNISpAvfHyJkjWwpkoxf0S?=
 =?us-ascii?Q?T+cueHNFcngmSIbQWr7mBHn6B7l1sIlnCiGEcv5Q3zdBD6et+J/j3KFlEyP0?=
 =?us-ascii?Q?BAGS88QTKE9Yng4OcmsNzsHAGIee2XqweFr1imP/uqhzsrr0T3Icl7cmg+xP?=
 =?us-ascii?Q?TqZD24Q6CiyjvL2vKFNnF4lr1unOuKej3qxaUBZFe5/P3gyzrwTctFF1soNq?=
 =?us-ascii?Q?lrALwyKEQBRbpJF7bWxU+IAj2Ljk6+C1XyNzwn6fUKdw47ts38nJsh7YywNd?=
 =?us-ascii?Q?WkOAp8TLyIfEhsFug6gjbZP5jjYAwRLFuKhUoe4f1HGA4+f/Q6vMMmljX8p/?=
 =?us-ascii?Q?bw1fT75WncTEDlCXVn1+nNT3mU7hxPjDsziSGAsmX92uRSBtBpyTLNrGpbbk?=
 =?us-ascii?Q?caKQfQ0AztsOhl+1WcZkS6XyIQ3Ij+5yqx7o9tnFNsbPE9drHPWBsQv1sAzy?=
 =?us-ascii?Q?VabHdjbUMy1eUgfyYoaoIkTqRRGx2zAD8IbTzNKl4KvsH5cJHw/T679sykqt?=
 =?us-ascii?Q?W1fedr1Vix2i0QMgJw2xVVjDjSuFNVi8sFdzxPO//5lMDa+T1XNDVrdmRqkj?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wOm9Gv0A0bnz4nd2CKqxDPTN/m0wFD5iOGrFf1zluOgQ5vtaQmVGMPnVUH8zXdffaJD1mv1X1E2TwBkw3jo3QYG4pq9+o7y79TZMRK29TIXg6JA28FXsmWLEfRCeVYJS+xUxj2cynqx595yPbFpPKRwB3ZfXwBGrG9cOIwEaaI/YTODVMTCIOTAoqhuKwsLpYD3vbqXaqmq12Kg7hNWVlLFar3kOO+Q6iejDbqaQxlejqrsPniGJ3Wm7q8NCDYXv1su+zo/DtUxcuToipMLwXEa35GsDRFzpWcBxhLYMmTxSGf6Kudw2KOuZptapVvD5XPzGNQyHi+uva+fGlEFfNMKvNI08KCPM3La6bkEnudjWLEyDTVqn7SttCd2+rpu8h7w7lYW93NkXrUBgFwApKahMEiImq7mMvj+jPIYvZIIqEqsYEDwQnU9QtG5mTR7xDYlzRYrmN5mnCCgUkZMJe9jVSWb9N2SQ9ZzpIVTK0vl7PqHicwHMPqW+tvHTMjfVn+xLJ4uMGNnnSMB/YinUDNd59/GPhSFF4M8sdq+DlimwDUD21rzPdkaVZbGvGgILQnmPccpvxFQiIre3tQZZCaudRSsXfhj0OkInZqsKJls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e36b77e-7e07-4a6d-960a-08dcf4535169
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:43:06.7496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 514ltJVxPIbDaBF7X6Wf95O7Pw1eJ4w59Yf0w0EJHlnJ3XMAnD/CUBGb6dpZNSCo3/H5ORV9KsXpw5I4V+EUEPYayTIPjfAYyr0hRgF3J6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6360
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_16,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240145
X-Proofpoint-GUID: HWjYV7qHs-e9e_rgHhWacln_KAuxlbCp
X-Proofpoint-ORIG-GUID: HWjYV7qHs-e9e_rgHhWacln_KAuxlbCp

On Thu, Oct 24, 2024 at 01:21:43PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There is already a test to check that "dtrace -l" sees USDT
> probes come and go as an executable loads and unloads a shared
> library with USDT probes.  (See dlclose1.sh.)  But it could
> also fail if DTrace does not immediately notice USDT probes
> coming or going.
> 
> Introduce a test that allows a grace period before DTrace
> notices a USDT probe come or go.
> 
> There is a deadlib.so here.  It is not needed for the test.
> It simply mimics other, similar tests.  The real thing to do
> might be to put these shared libraries, common to multiple
> tests, in test/triggers.

It seems like you removed deadlib, so why paragraph should go also.

With that removed...

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/tst.dlclose4.r  |   5 +
>  test/unittest/usdt/tst.dlclose4.sh | 210 +++++++++++++++++++++++++++++
>  2 files changed, 215 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.dlclose4.r
>  create mode 100755 test/unittest/usdt/tst.dlclose4.sh
> 
> diff --git a/test/unittest/usdt/tst.dlclose4.r b/test/unittest/usdt/tst.dlclose4.r
> new file mode 100644
> index 000000000..07927a4a4
> --- /dev/null
> +++ b/test/unittest/usdt/tst.dlclose4.r
> @@ -0,0 +1,5 @@
> +as expected: USDT probe appeared
> +as expected: USDT probe disappeared
> +as expected: USDT probe appeared
> +as expected: USDT probe disappeared
> +success
> diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
> new file mode 100755
> index 000000000..eaf4905ce
> --- /dev/null
> +++ b/test/unittest/usdt/tst.dlclose4.sh
> @@ -0,0 +1,210 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +PATH=/usr/bin:/usr/sbin:$PATH
> +
> +#
> +# In this test, we send alternating USR1 and USR2 signals to an executable
> +# that responds by opening and closing, respectively, a shared library with
> +# USDT probes.  After each signal, we check "dtrace -l" to confirm that the
> +# USDT probes are and are not listed, as expected.
> +#
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +#
> +# Set up the source files.
> +#
> +
> +cat > Makefile <<EOF
> +all: main livelib.so
> +
> +main: main.o prov.o
> +	\$(CC) -o main main.o -ldl
> +
> +main.o: main.c
> +	\$(CC) -c main.c
> +
> +livelib.so: livelib.o prov.o
> +	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
> +
> +livelib.o: livelib.c prov.h
> +	\$(CC) -c livelib.c
> +
> +prov.o: livelib.o prov.d
> +	$dtrace -G -s prov.d livelib.o
> +
> +prov.h: prov.d
> +	$dtrace -h -s prov.d
> +
> +clean:
> +	rm -f main.o livelib.o prov.o prov.h
> +
> +clobber: clean
> +	rm -f main livelib.so
> +EOF
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go();
> +};
> +EOF
> +
> +cat > livelib.c <<EOF
> +#include "prov.h"
> +
> +void
> +go(void)
> +{
> +	TEST_PROV_GO();
> +}
> +EOF
> +
> +cat > main.c <<EOF
> +#include <dlfcn.h>
> +#include <unistd.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +void *live;
> +
> +/*
> + * Open and close livelib.so, thereby adding or removing USDT probes.
> + */
> +
> +static void my_open(int sig) {
> +	live = dlopen("./livelib.so", RTLD_LAZY | RTLD_LOCAL);
> +	if (live == NULL) {
> +		printf("dlopen of livelib.so failed: %s\n", dlerror());
> +		exit(1);
> +	}
> +}
> +
> +static void my_close(int sig) {
> +	dlclose(live);
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct sigaction act;
> +
> +	/*
> +	 * Set USR1 (USR2) to open (close) the livelib.so.
> +	 */
> +	act.sa_flags = 0;
> +	act.sa_handler = my_open;
> +	if (sigaction(SIGUSR1, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +	act.sa_handler = my_close;
> +	if (sigaction(SIGUSR2, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +
> +	/*
> +	 * Listen for signals.
> +	 */
> +	while (pause() == -1)
> +		;
> +
> +	return 0;
> +}
> +EOF
> +
> +#
> +# Build.
> +#
> +
> +make > /dev/null
> +if [ $? -ne 0 ]; then
> +	echo "failed to build" >& 2
> +	exit 1
> +fi
> +
> +# Define a function that looks for the USDT probe with "dtrace -l".
> +# For debugging, one could also check:
> +#     ls /run/dtrace/probes/$pid/test_prov$pid/livelib.so/go/go 
> +#     ls /run/dtrace/stash/dof-pid/$pid/*/parsed/test_prov:livelib.so:go:go 
> +
> +function check_USDT_probes() {
> +	$dtrace -lP test_prov$pid |& awk '
> +	    /ID *PROVIDER *MODULE *FUNCTION *NAME/ { next }
> +	    /test_prov'$pid' *livelib\.so *go *go/ { exit(0) }
> +	    /No probe matches description/ { exit(1) }'
> +	return $?
> +}
> +
> +# Define a function that checks loading the library:
> +# send USR1 and wait up to 6 seconds for the USDT probe to appear.
> +
> +function load_lib() {
> +	kill -s USR1 $pid
> +	for iter in `seq 6`; do
> +		sleep 1
> +		if check_USDT_probes; then
> +			iter=0
> +			break
> +		fi
> +	done
> +	if [[ $iter -ne 0 ]]; then
> +		echo did not see USDT probe
> +		kill -s KILL $pid
> +		exit 1
> +	fi
> +	echo as expected: USDT probe appeared
> +}
> +
> +# Define a function that checks unloading the library:
> +# send USR2 and wait up to 6 seconds for the USDT probe to disappear.
> +
> +function unload_lib() {
> +	kill -s USR2 $pid  # send USR2 to unload library and USDT probe
> +	for iter in `seq 6`; do
> +		sleep 1
> +		if ! check_USDT_probes; then
> +			iter=0
> +			break
> +		fi
> +	done
> +	if [[ $iter -ne 0 ]]; then
> +		echo still see USDT probe after timeout
> +		kill -s KILL $pid
> +		exit 1
> +	fi
> +	echo as expected: USDT probe disappeared
> +}
> +
> +# Start the process.
> +
> +./main &
> +pid=$!
> +sleep 2
> +
> +# Check.
> +
> +load_lib
> +unload_lib
> +load_lib
> +unload_lib
> +
> +# Clean up.
> +
> +kill -s KILL $pid
> +wait $pid >& /dev/null
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
