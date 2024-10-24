Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA01F80C4
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779726; cv=fail; b=jAywYUqupEIF5XDkrSUQIVuE6Vr9yDXdRLhXFLKpGVq5YEIcMfBezEKDrPmJaAML3Ht8dUq2GXh58czcBgac8LpIY87f/6HncBBbJpPwYIXV1eSKVEDVZMJT7Wej+y+efEg79Pgx48b09JLEL00cF+gtLbRTe8J3ECn+m9TRf8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779726; c=relaxed/simple;
	bh=pO6OO4te1chfPlWCuLXEewnVu2lAnP5rSo1768ifqgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZKVeZZmDnLhPg4thGDQfZEEkOXC29Nf4Z85EJXrGHp+fnHrt8oveBAR6yqBSPHypyPCkZk5bC+PDwzVjW/JJetPg8PabDYciNDptAsBy92sKjoGr7Pf5fSInSsJv2qy7UlYtqTxiWlHfzGeW83oeVmKwZaQY34HeBKwv0YolUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TMxz7/c7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TK65iO8o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TMxz7/c7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TK65iO8o"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OC1ZSv025348
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YtkYfuu9zBiyK5jJS1
	nxne5s3zZ/J2vDXxIE33Mv01A=; b=TMxz7/c7kPp3LLf17EMPJV1mDkZeZ/vGLZ
	iMny/pbZ93I9xrmuVi1jYvIcEbGXwKzOusLl5xBpxlPtPqKlp/zsBwipVN6hycbi
	YBm++DokptlaTxq8y8l1fpixjfjNcWq/1zLcin9bhivyqOrFfyDBHT0ZBaGCH70r
	i75Jho1tVDQJddkpiUFk7YsmHtfTFLtspxkaOmGuHKfWl42SLQD6lItqy4sUjFqs
	5GW13yH85ZPQCgCGDum5QQ5L+exQ98HVGI3tpuAH+YH/h0MolZNEVjGYceGS5c4R
	6nPD5JjXhNWFKzK2YC5xPz4ZWpr2VyS4qVm8rA6pQwKf2FYAGdMQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ejmxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:22:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OE2Med036138
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:22:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh41dks-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbxTyjndZ0YrQUMQ30mEduJqDJWxSIHKQlp/4+oH3bxItfG49L1UkMaPtuw3XleBpWnT/8/nopiv79t0U6ejzL7JQMbTeYDYQtxLAuC876MeN6ZEH/EU1kBOXmQFWnpcRR8K+v+Q3+Y5DuLfAtN17RAGF/oHbLPecnwtbwLbMqGSt/gUd76wmXSh3m5TOPep24q2opS/YPpZQAJSWs8j5BawpegYxXkbUzRRW+FiBsyaP2fpPBXM9kOtPzQ5QmGBthHXD8MSZSrdb9PkLeqeOpxpWiQNFIBknQuS4HwzI8obmKwrtbEu6ho4LgJNCxWoCVtVB61L+IJc3wbDCNk5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtkYfuu9zBiyK5jJS1nxne5s3zZ/J2vDXxIE33Mv01A=;
 b=nB8jVAlW69yFS9M87LF9CMQGr/xNcnpewuCu9v1jEsLyOuJZIb96MQWlN7xDyIIKict2fRIbnhWjInRxxSNcw/EeSDUOem7g7XHUW1ZFV2BDIiZoPFrE5ECWkTrwyEk/sX0sLwhNWGak3aAgJn3r7ySpPUirHqSz8uCUCvsvGnj/QrmsyzZSAdpFXpxJ+e448zJiUaF5iWcwhlQhvehOFTdg8L5d5lt5awKG/wbD9tadGPpMZfF5TLufJff9qjzxL1i7kvSPFRPhAhmNwOTvrXFeGCX84h3FRrN7Ofa2thHXBXM/8Vr4Hl2dPMxUd3tjaT3k3YlP2Z0rvidprux7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtkYfuu9zBiyK5jJS1nxne5s3zZ/J2vDXxIE33Mv01A=;
 b=TK65iO8oilUPZzDmhmvysizJ3Gpy5kfWQ5rhMSHAb3ieXKwvO3rCHBwdpzQRdp8bea0MCFp9lBd8Ou5sN1sI9cape3K4rf8+6MN5ljqAxZmdKGVfloNuH6Kt6sQVfTvOGtG3OxHeEAde541QVHvODliod9OpigJZgahpE+smpi0=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MW6PR10MB7659.namprd10.prod.outlook.com (2603:10b6:303:246::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Thu, 24 Oct
 2024 14:21:57 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 14:21:57 +0000
Date: Thu, 24 Oct 2024 10:21:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 09/19] Use usdt_prids map to call clauses
 conditionally for USDT probes
Message-ID: <ZxpYA4ZPIliseChW@kvh-deb-bpf.us.oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
 <20241016160139.29589-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016160139.29589-3-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MW6PR10MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a55035-87b9-4300-45b3-08dcf4373796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X4aNLqo00di7W+Niu7eDI3UEZI1QXdd8bHvLGLlItnjV1cszsmqnWg+SIA0a?=
 =?us-ascii?Q?X7s9dxoQdxzF9hi7JKZ3xcLipbtpheSl73fscIUUzEA24nWReyLXEXPLNOl2?=
 =?us-ascii?Q?LPEzzwRZOniM6eswNbP26aUenFYe4raP4M31DSRxflyy6XZ8l90hw+Xh4XGE?=
 =?us-ascii?Q?MlG/c8gQjHit3GyBX4gZvhyMG37J7m2VujDHh6/f4ySuvhCKLiMMZ5le1EqG?=
 =?us-ascii?Q?Fc9/bOznIFpXp5eZ8xAq4Xjk00LsjHqjQdFV5X8yI12gCm+EBHEpxvI50bss?=
 =?us-ascii?Q?oXepgXJqgxOSvfQE/zHeK7zDKPojWyBraF2jIqIFxj5sN8qlMfcwbIXJkrOQ?=
 =?us-ascii?Q?hCVPzMrDWuK3PPV9kt+xHlqH8FFKD8c7FU74o279cKBFLQOyP7orCVudZ+kZ?=
 =?us-ascii?Q?/7MkT0n4Ppfq9gbK/rC035BIdRamgGvD7gOtx8qA4cyyi+E+qGSSitIEDLxB?=
 =?us-ascii?Q?PQ8bvd7PHMzWOJ5iYOIamoC0fKNUgv99pXc5pWiyyJ1k9vtgrIdutNJHKGM4?=
 =?us-ascii?Q?IqNA3YFvjL9Itafw1mVp5xAQlcGlAYbcY2SaKrlX61WGsCWDtvFDAhKonG09?=
 =?us-ascii?Q?AMMCIbp6L92hd/hhHOL5CDC20cn9nn3H6jpksWSU2kuwm+bdZIz/6pGoFvdj?=
 =?us-ascii?Q?zxXn0E9lqa9BBJWejGCEpgE7oooQHkh1NLJ4K/M2Aynuh9gCsMmq9Oh10g0a?=
 =?us-ascii?Q?0J2tH7f8f3BxCbS5THd54hsCkEaT9zdGVzK7C7GEvZV2WTZF5dmDUjviTz0k?=
 =?us-ascii?Q?eFMSTn3HjAy+l4olnqC9tCfNCxcTj3L4iUrAxBK+1YmfJ1anuvHtajDuBpTl?=
 =?us-ascii?Q?HdP1h6dhcQxyPdJX4TsVLsf9gojv6fuXulfX59jVHrILLR0MDm9j4wQidBuq?=
 =?us-ascii?Q?MjzCX+k1UoSQ23WPhT+U19yT9SxvEg7i1TTp7qBF/o269lpd7Ng3L+4D5NX1?=
 =?us-ascii?Q?jIpfeUB1BpwcibnawQi8fRHLtIXgw7XmKAyTXSmBJ5daFBvpoWG36P3NGiaf?=
 =?us-ascii?Q?SNSjF57zTNgwB6NiebdwW4+HmSbhRSbkLWejNPwfAeeASYAnGf0Hiv3DTQyS?=
 =?us-ascii?Q?i5SZX9Pu1Z/bGNyTjdMOJfOoX0lUbfICOwM1tV9WUET03Sp7WaNIQ+RLNGju?=
 =?us-ascii?Q?L6t8maqc3v7tKUUe2ae5xdWh0E7/0C58IPPDoM+3nGUTwd+2dcPYKHw7tzBg?=
 =?us-ascii?Q?ebC2AboUAsvMPdgBYMpLj1rmuIfwG8I2c8u/pnaLtliwpjr1Fs/TElanPlBt?=
 =?us-ascii?Q?gemAObVy2C4RqEby1ybwVBaaZOPmDKjj2wvPklOcPuz+QkhOq52LP9YtdRxX?=
 =?us-ascii?Q?CSfyNiF4phhywHCGSRNzd2Aw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PM4YK71Jq0O88jSGb4cHCxETCfdWcQ0FLhEHfrK/Xv9LtRvlkfOpkx0D3K8f?=
 =?us-ascii?Q?mzfzYsHVwCbQUgzGbUVi5xS9d7hRGGNFOS5Gy33XGaAifEytw4unjH4qUzQ6?=
 =?us-ascii?Q?oIn5kfKzxdlsIZxztQ+qTuyTUCSX1UoI39zgFxOf+N7463II6NIoXhRdIzqo?=
 =?us-ascii?Q?0HZ2lj3AZsEbrOy33Hra+cshPijSW1IlaxPCOIrBzp4DAO7GVznxJRAtrCkh?=
 =?us-ascii?Q?ds+oGpgcGCmhRdZ/x8IiZz7h98/EEkl1MQK8rbp9Kk2+/Vbay75h4Qctjr6G?=
 =?us-ascii?Q?Ia9XV4gOBvi5Wv900GC6AE/z+d3DFdZHqvwEDZWALYk2YZoouz5AFAAEuEoB?=
 =?us-ascii?Q?LLDhD61eD8DBSfHV7V73HwzjDGw2rH9Ng/+pnvA3E1t2fkgoWDjBoAgloyYL?=
 =?us-ascii?Q?vRGrbR0BOTwnZvdk5dBpfAg3mlnhyDW+8ab4ZEHmh/OusfkzoeVDVmcrNMGu?=
 =?us-ascii?Q?n0X6apSFpfVkRwO7KZiik6hdKz0LiLtgZnsfSJdouQO3TzAb+x0no69/+57F?=
 =?us-ascii?Q?C+8YnLcz9zXOcPnDmFPEnymNqroYDcM9f7FD0uhE2UT6kvEMQduN0aw6TAqz?=
 =?us-ascii?Q?sTNYtksgFbV27RVbGl1syJfsvYR7erjXYCrLUJU4aTnOoYkTO0Vv6mhgfWMC?=
 =?us-ascii?Q?fXDqFuQQFtInXvbP1oumbjUAHKQuHvIeXe/GROeVWRgPRkDVvuCFfBvEeMcf?=
 =?us-ascii?Q?NDzzbP2NUDNtM6mVgvY753jZRykSpWLpeSVO/0B26UXW8+D0k6mwLejkifK8?=
 =?us-ascii?Q?+8+N/E0IEdyjUIgmU3EMkv7upd6sibcZInZtfFCAFz14Xa69zW/fjlA5lkDO?=
 =?us-ascii?Q?XREmglQN/QYvgG+4J+/DGMURiqbrU6E47TWA9NcKfACnSzN4MYkZGz1EPEqm?=
 =?us-ascii?Q?AgJccQiOiLLnNR/WEokL2lRLN9eoF/snJ/03DS7rV8UFPIO4f9fjiJOS+I4W?=
 =?us-ascii?Q?QDRFr9rEhxTR7kSi9WWp0OeBCJKXpBdI7zyq4PPa7W4aLysT0adALXfqnyXa?=
 =?us-ascii?Q?+dw54lNdQ5f0ZFJVbrH1Gio64CCINd/QXI48ReAQFxuhB93C1V/9Jeorksu1?=
 =?us-ascii?Q?HSCtE315QN1HdaA/1l9GmNzk8Lp4YLCriBILL+2HcB1VRzNZCKvvm0l73zte?=
 =?us-ascii?Q?rKyeZvE2avMsQcmve8K4zcQdV6Heox8c3nQlGoKdWXLxBirVCQDdVjlZr8ll?=
 =?us-ascii?Q?u0+VMccaTCL5SNxoV1GlDgEPELxbAdYZMi9/w4WtgTAeouqMKeDgNtC6j1Vr?=
 =?us-ascii?Q?OQvgBJ3D0lyKDWzyKyM9X0y7LH1LTq4hxS/lrCXWt235U5Ke+4gLJsCGFsk/?=
 =?us-ascii?Q?Xn8MJWVtRgo3aK7j36KF0dRBI8Yg37xZuNmla0Gt/Bh40KhIbElmyp0hy7Pd?=
 =?us-ascii?Q?MJMcjWs2PPOAJC5c6CgFp51AvrKqiC0oP07q8TadN1C6DcTt3sH3iwBxVLkZ?=
 =?us-ascii?Q?6Ev3N7M+PJGbvALQPL+uOH+URLSZc8HLWvYEbgYCwqX/TDfA2IY+wE82UhDf?=
 =?us-ascii?Q?OoEY24xB9VMswTJ7YaFSdDhO+Vq7Kzsm08Jb1F5i6P6XzerOGbfdBkSZAA40?=
 =?us-ascii?Q?xgcJ1baiBDIclStrYWnhcf3XV2Uq6gPIVtlM5ojLpX1Q98JV1lYL2AkwG7T9?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q0EMLYf3dkVCu7nZCBctv1Xji7T0sLJ/1CqNLbC00/fsye4eU2mRtuU352z2RgqoBF8x0Up+JB2P1OIe490vKJtMmYQtXghmnWCbFjwkVXnMi+Ilml1A0P6c3cl4NTp05Gvk3HgkXk8GW1vxzP9R9aWSsgJYv8LadI1PdA43ZwuTnfgl4yZfrjLfwI+qpHjPeMnPUDuE7nRzqwz5RNpANVEsrX3VOktPIIvvOooCt79yTQRkjhrgjXvq1mdICT+xwtNyxaZsA2L5MW6rJnXEbEADTiUtVxRx+NgUN4XmIH71AwOJ9160IU/fUWAs5Olkiilsy7xp3N7EFvxxqIhW/JBewqREZh3tjrJbCtAstBGmWu6INx7QvlaretJKYo+INuuio02z8W2jYa7POQwHw6SmBp0eEFDmBbBgFak4MTHZbwufbEkr9uKvQ45jhZGCJ6sHQqeAvO+OVHiTC8k1tPrrt64e8ruSAz3djqdncnj2RlDetAr06qAoyIYu51Z5YnEjHhotc6AkIjTvy0AR7hMH4CG6k635o+Xuq/OT4DiUl+CC7LYhUX9+qdL2nyYxPJwLDbZecea9nctHYKLjBf6Ktq51YYzaw5exCLx9OvE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a55035-87b9-4300-45b3-08dcf4373796
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:21:57.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: By36v1dmkyaIvYd+IOAYDNk4hCq89/m1lM72Y6RAOl7/Syj81THueRLjfCMPb5NmP6ckhijCD1wt4jnvcckqHrizJ/I4ei6TzK7/POst/rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7659
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240117
X-Proofpoint-ORIG-GUID: xCvzxMVccxEVBWil4fHcNMRje0lIuDQ3
X-Proofpoint-GUID: xCvzxMVccxEVBWil4fHcNMRje0lIuDQ3

On Wed, Oct 16, 2024 at 12:01:38PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This version supports only up to 64 clauses for an underlying
> probe, but it can be extended to more clauses.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with a very tiny pedantic comment and some comment about future work.

> ---
>  libdtrace/dt_prov_uprobe.c            | 166 ++++++++++++++++++-------
>  test/unittest/usdt/tst.nusdtprobes.r  |   5 +
>  test/unittest/usdt/tst.nusdtprobes.sh | 172 ++++++++++++++++++++++++++
>  3 files changed, 300 insertions(+), 43 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.nusdtprobes.r
>  create mode 100755 test/unittest/usdt/tst.nusdtprobes.sh
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index b010d8687..268708179 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -739,11 +739,16 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> +	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
>  	const dt_probe_t	*uprp = pcb->pcb_probe;
>  	const dt_uprobe_t	*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
> +	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> +	int			n;
> +
> +	assert(usdt_prids != NULL);
>  
>  	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
>  
> @@ -755,14 +760,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
>  
>  	/*
> -	 * Loop over overlying probes, calling clauses for those that match:
> +	 * pid probes.
> +	 *
> +	 * Loop over overlying pid probes, calling clauses for those that match:
>  	 *
> -	 *	for overlying probes (that match except possibly for pid)
> +	 *	for overlying pid probes (that match except possibly for pid)
>  	 *		if (pid matches) {
>  	 *			dctx->mst->prid = PRID1;
>  	 *			< any number of clause calls >
>  	 *		}
>  	 */
> +

Pedantic - but no empty line is needed here.

>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
>  		const dt_probe_t	*prp = pop->probe;
> @@ -770,6 +778,9 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		pid_t			pid;
>  		dt_ident_t		*idp;
>  
> +		if (prp->prov->impl != &dt_pid)
> +			continue;

Stuff for future: put pid probes and USDT probes in separate lists so you
don't need to have a conditional like this.

> +
>  		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
>  		assert(pid != -1);
>  
> @@ -801,6 +812,93 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  			   BPF_NOP());
>  	}
>  
> +	/*
> +	 * USDT
> +	 */
> +
> +	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
> +	if (upp->flags & PP_IS_RETURN)
> +		goto out;
> +
> +	dt_cg_tramp_copy_args_from_regs(pcb, 0);
> +
> +	/*
> +	 * Retrieve the PID of the process that caused the probe to fire.
> +	 */
> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +
> +	/*
> +	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> +	 * will be used on the BPF stack:
> +	 *
> +	 *     offset                                       value
> +	 *
> +	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> +	 *
> +	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> +	 *     ==
> +	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
> +	 */
> +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> +	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> +	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
> +
> +	/* Read the PRID from the table lookup and store to mst->prid. */
> +	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
> +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
> +
> +	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
> +	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
> +
> +	/*
> +	 * Hold the bit mask in %r6 between clause calls.
> +	 */
> +	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +		dtrace_stmtdesc_t *stp;
> +		dt_ident_t	*idp;
> +		uint_t		lbl_next = dt_irlist_label(dlp);
> +
> +		stp = dtp->dt_stmts[n];
> +		if (stp == NULL)
> +			continue;
> +
> +		idp = stp->dtsd_clause;
> +
> +		/* If the lowest %r6 bit is 0, skip over this clause. */
> +		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
> +
> +		/*
> +		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
> +		 *	      goto exit;      // ldw %r0, [%r0 + 0]
> +		 *			      // jne %r0, act, lbl_exit
> +		 */
> +		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
> +		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
> +
> +		/* dctx.mst->scratch_top = 8 */
> +		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
> +
> +		/* Call clause. */
> +		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
> +		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
> +
> +		/* Finished this clause. */
> +		emitl(dlp, lbl_next,
> +			   BPF_NOP());
> +
> +		/* Right-shift %r6. */
> +		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
> +	}
> +
> +out:
>  	dt_cg_tramp_return(pcb);
>  
>  	return 0;
> @@ -846,10 +944,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  {
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
>  	const dt_probe_t	*uprp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = uprp->prv_data;
> -	const list_probe_t	*pop;
> -	uint_t			lbl_assign = dt_irlist_label(dlp);
> -	uint_t			lbl_exit = pcb->pcb_exitlbl;
> +	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
> +
> +	assert(usdt_prids != NULL);
>  
>  	dt_cg_tramp_prologue(pcb);
>  
> @@ -858,7 +955,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  	 *				//     (%r7 = dctx->mst)
>  	 *				//     (%r8 = dctx->ctx)
>  	 */
> -
>  	dt_cg_tramp_copy_regs(pcb);
>  
>  	/*
> @@ -876,46 +972,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>  
>  	/*
> -	 * Generate a composite conditional clause, as above, except that rather
> -	 * than emitting call_clauses, we emit copyouts instead, using
> -	 * copyout_val() above:
> +	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> +	 * will be used on the BPF stack:
>  	 *
> -	 *	if (pid == PID1) {
> -	 *		goto assign;
> -	 *	} else if (pid == PID2) {
> -	 *		goto assign;
> -	 *	} else if (pid == ...) {
> -	 *		goto assign;
> -	 *	}
> -	 *	goto exit;
> -	 *	assign:
> -	 *	    *arg0 = 1;
> -	 *	goto exit;
> +	 *     offset                                       value
>  	 *
> -	 * It is valid and safe to use %r0 to hold the pid value because there
> -	 * are no assignments to %r0 possible in between the conditional
> -	 * statements.
> +	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> +	 *
> +	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> +	 *     ==
> +	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
>  	 */
> -	for (pop = dt_list_next(&upp->probes); pop != NULL;
> -	     pop = dt_list_next(pop)) {
> -		const dt_probe_t	*prp = pop->probe;
> -		pid_t			pid;
> -		dt_ident_t		*idp;
> +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> +	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> +	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
>  
> -		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
> -		assert(pid != -1);
> -
> -		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
> -		assert(idp != NULL);
> -
> -		/*
> -		 * Check whether this pid-provider probe serves the current
> -		 * process, and copy out a 1 into arg 0 if so.
> -		 */
> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
> -	}
> -	emit(dlp,  BPF_JUMP(lbl_exit));
> -	copyout_val(pcb, lbl_assign, 1, 0);
> +	/*
> +	 * If we succeeded, then we use copyout_val() above to assign:
> +	 *	    *arg0 = 1;
> +	 */
> +	copyout_val(pcb, DT_LBL_NONE, 1, 0);
>  
>  	dt_cg_tramp_return(pcb);
>  
> diff --git a/test/unittest/usdt/tst.nusdtprobes.r b/test/unittest/usdt/tst.nusdtprobes.r
> new file mode 100644
> index 000000000..d894af92e
> --- /dev/null
> +++ b/test/unittest/usdt/tst.nusdtprobes.r
> @@ -0,0 +1,5 @@
> +try ""
> +try "-xnusdtprobes=40"
> +try "-xnusdtprobes=39"
> +Files check.txt.sorted and dtrace.out.sorted differ
> +success
> diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
> new file mode 100755
> index 000000000..50f18a6ca
> --- /dev/null
> +++ b/test/unittest/usdt/tst.nusdtprobes.sh
> @@ -0,0 +1,172 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies the nusdtprobes option.
> +# @@timeout: 100
> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/nusdtprobes.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make the trigger.
> +
> +cat << EOF > prov.d
> +provider testprov {
> +	probe foo0();
> +	probe foo1();
> +	probe foo2();
> +	probe foo3();
> +	probe foo4();
> +	probe foo5();
> +	probe foo6();
> +	probe foo7();
> +	probe foo8();
> +	probe foo9();
> +};
> +EOF
> +
> +cat << EOF > main.c
> +#include <unistd.h>
> +#include "prov.h"
> +
> +int
> +main(int argc, char **argv)
> +{
> +	while (1) {
> +		usleep(1000);
> +
> +		TESTPROV_FOO0();
> +		TESTPROV_FOO1();
> +		TESTPROV_FOO2();
> +		TESTPROV_FOO3();
> +		TESTPROV_FOO4();
> +		TESTPROV_FOO5();
> +		TESTPROV_FOO6();
> +		TESTPROV_FOO7();
> +		TESTPROV_FOO8();
> +		TESTPROV_FOO9();
> +	}
> +
> +	return 0;
> +}
> +EOF
> +
> +# Build the trigger.
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -c main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test" >&2
> +	exit 1
> +fi
> +$dtrace -G -64 -s prov.d main.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -o main main.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +# Test nusdtprobes settings.
> +#
> +# We will start teams of processes, each with 4 members, each in turn
> +# with 10 USDT probes.  So, regardless of how many teams are run in
> +# succession, at any one time DTrace needs room for at least 40 USDT
> +# probes.  The default and -xnusdtprobes=40 settings should work, but
> +# -xnusdtprobes=39 should not.
> +nteams=2
> +nmmbrs=4
> +
> +for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
> +
> +	echo try '"'$nusdt'"'
> +
> +	# Start DTrace.
> +
> +	rm -f dtrace.out
> +	$dtrace $dt_flags $nusdt -Zq -o dtrace.out -n '
> +	testprov*:::
> +	{
> +		@[probeprov, probemod, probefunc, probename] = count();
> +	}' &
> +	dtpid=$!
> +	sleep 2
> +	if [[ ! -d /proc/$dtpid ]]; then
> +		echo ERROR dtrace died
> +		cat dtrace.out
> +		exit 1
> +	fi
> +
> +	# Start teams of processes, only one team at a time.
> +
> +	rm -f check.txt
> +	for (( iteam = 0; iteam < $nteams; iteam++ )); do
> +		# Start the team, writing out expected output.
> +		sleep 2
> +		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
> +			./main &
> +			pids[$immbr]=$!
> +			for j in `seq 0 9`; do
> +				echo testprov${pids[$immbr]} main main foo$j >> check.txt
> +			done
> +		done
> +
> +		# Kill the team.
> +		sleep 3
> +		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
> +			kill ${pids[$immbr]}
> +		done
> +	done
> +
> +	# Kill DTrace.
> +
> +	kill $dtpid
> +	wait
> +
> +	# Strip the count() value out since we do not know its exact value.
> +
> +	awk 'NF == 5 { print $1, $2, $3, $4 }' dtrace.out | sort > dtrace.out.sorted
> +
> +	# Check.
> +
> +	sort check.txt > check.txt.sorted
> +	if [ x$nusdt == x"-xnusdtprobes=39" ]; then
> +		# Results should not agree with check.txt.
> +		if diff -q check.txt.sorted dtrace.out.sorted; then
> +			echo ERROR unexpected agreement
> +			cat dtrace.out
> +			exit 0
> +		fi
> +	else
> +		# Results should agree with check.txt.
> +		if ! diff -q check.txt.sorted dtrace.out.sorted; then
> +			echo ERROR output disagrees
> +			echo === expected ===
> +			cat check.txt.sorted
> +			echo === got ===
> +			cat dtrace.out.sorted
> +			echo === diff ===
> +			diff check.txt.sorted dtrace.out.sorted
> +			exit 1
> +		fi
> +	fi
> +done
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
