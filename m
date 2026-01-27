Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22532ED846
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518543; cv=fail; b=nGOvZHYJuckfTrIdAoJRmZqa9SwBF27L1CkczlpswPgn4AWw92clYSKV/xj5kK6IQKnGEn3+ha9EqQLuccgtXGUZXJz40KFmEY2d60u94/k8v7SdpSoupfI6lGz2E20gANB9orfBNQDN0B4Zu9WSvzhxkEc+9kCwpEAs+t6xT54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518543; c=relaxed/simple;
	bh=tkDw94UdMbvaZxGelwe2a87e15Iv4q3kBTwYlmLZcPM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=mLh0lSDpoA/xKc9Js1MRLL0Z2wEBlQfIq1vAhfPADoEjR8PCLjVVnb43IwbUvpWIshiaCPZwZibwIfc01HpYI55JJakBdCVJcepECizEq5H6WcdRrNPMzaV+oUmPMnBo7sL5xZhKbCN9O7GWx1DXS7fGawyYBXylIa8At1zmWJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hy0P+XQC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FE7W36CR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hy0P+XQC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FE7W36CR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEbkh455837
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=39WVa7MEWxscaz6Atj
	0I+foCj4TfpuIq+mYwEVaQDUQ=; b=Hy0P+XQCn4QcQ8PemzU2Tnseqe5Dn63HLO
	RWLeTDcQTXxlKz7+2iIKO6U6nTSHnW2+3rJR4mc9UjjLxfN9x344XVLf+twXbXYb
	vba5u+9MINRtv3zeSic7a6NMD9eodIhp599fHv7i4bQhxcRO9PCD9i9uFG6HHVrX
	HUvkRFh6XJ5CoPjBsYkX4N71xKGYI42SopZnU7tD0z1EecSKXZsFryQLgviNyFKV
	L41z6K3U3VTzXMn1dBOUv3m3R7gQXhaSvs1jvVHFujIYLWu9Qfq7yhDfO+bDBhvd
	PnDhLKSNAAXuGlQdnFcG+ifFZ2SVbQYCKBQCXzmZWQw8Burq3+tA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvp4buyv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:55:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RCkjxL035152
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:55:39 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9bxkk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYbIGuRcwD2hENCSe0Iu2U4LgqSZmNzA7emNnPO7aqIvwbbX4sv0u0N8nb9qiDFV2Qrs1n1rLBpB9hbyy54Stypjda3xn0B8naA06v3ggXhA5jatPsz5Hb/RwR3MrdO4pB9OOajRQmsGkf92l0QmuCmKMjtysRtTgyxinObxOyh+t6oH0oHVYs4U5vMjCwdu7aNp/bx3wg60qREW5vBKqXcJQBYaIGF1GCX+V8maBFcsxTNZCZo3O/lc+Fr2XRJsuOvFAgoPIhoUhaEAahIHdjwfAs18pp2WYNRiZiLZq1bjFvVJOcZxUVuRWcSnNspfBhxu1kyrG/q77U7ZAkpzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39WVa7MEWxscaz6Atj0I+foCj4TfpuIq+mYwEVaQDUQ=;
 b=i0GyXUxr5Uufv3QosqW1UnbnUWDx17lgQKzfUNnfDbr0THe1ei0z+aoLd307ZyID1fb7RUJI4qdRHzaDgR79l1PhSxq7CGm/rgN1Ic1JoFcPx3/ji+hFPAJIL9WUWTp9z9N2M3VSY9D/NTxOjHZ89RMY+5JeAWv0vPPr+w2YoTPHcKw2zM1Or6P7isDkadPR1FjHGtZ5n/1Hp2fJNwKdFHxp1C3uqsAvC3UMM0mijWZ+ih47/GCTI0IfV1WkN8LddH6fRHoPRtaO6k7w9HO3JDjiwWTwihH6KjDsbTAUDzkgpb7jtlqZsqd1LqpKyKnPOiu0DcAi4X+KPhj/4762gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39WVa7MEWxscaz6Atj0I+foCj4TfpuIq+mYwEVaQDUQ=;
 b=FE7W36CRMM30sIqrXoGIElk5zruCiIr8FFjdaVMwX2p2SO2F1NQcUWdlXuqQuWNcmqWERkawVXXP6aUcVWvdiMPsXfM/nEa1cu8q9SHMgXQkRnuzSWYE8KIZj/QPb0QIR7hiWZZ+akV4vZOyl12QS0uarBbz2P9qQkGEnBKPDEA=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by MN2PR10MB4206.namprd10.prod.outlook.com
 (2603:10b6:208:1df::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 12:55:37 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 12:55:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Account for readahead tracepoints
References: <20260122072314.10617-1-eugene.loh@oracle.com>
Emacs: because one operating system isn't enough.
Date: Tue, 27 Jan 2026 12:55:32 +0000
In-Reply-To: <20260122072314.10617-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 Jan 2026 02:23:14 -0500")
Message-ID: <87h5s72p17.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0586.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::7) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|MN2PR10MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 84948d7b-08e2-4a66-c466-08de5da35dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lgCCJPTH4LboCwzXeDmUslzZDZl4R3vkrNNO6W4q52qBAiS3zAUYqHYfVTQ/?=
 =?us-ascii?Q?MWAAwlktoaEtkTfYZ0mvbsGWPZTZoXcMgsc3aRu6Tj3SPBQqbQuIwY0Wy45e?=
 =?us-ascii?Q?AkFvByeuuG1uTQAtzlQkH90lralI3LcSJEy6qI+Erd5Pag2FgW0TWqFx1USg?=
 =?us-ascii?Q?02cOaWRnADhPrD4bUdPrv2vmGmUw0JZPdVUUfPHWnOZdzsgq+QhaSuY7sbyi?=
 =?us-ascii?Q?WvHg+KSqqPfHZVeMsYIkOFM6X5XtOIU2T3KZ8isoqyDjFODJIl2JdWkfqRQg?=
 =?us-ascii?Q?WsdcvyaGXLVzSBdTwhYJTnIrNQlHr+2Cw66iepcWOFpNWbg6McbVn376e7yG?=
 =?us-ascii?Q?HtCVbP2axP8zdGJVhGILWKKDUJqFiEJamoYwflrqdXHwAXLcgKBr2dVZd2FC?=
 =?us-ascii?Q?XQkTrSTI/tozBtvQ3XIqAu7bjzPabnrCDSGjhkK9TRdopHauioqaTowbdrKK?=
 =?us-ascii?Q?VhTWwiM1s4MnAr3S5c3dEn1gUs0ccZfXWg3TXxaN3b2s1FF+Dsv3nOrGazQX?=
 =?us-ascii?Q?q+jYzUbVwFuRNwMCFYK4njFgLUvsDHxt5yJ3oW1GaxZWJkc2DUDgOwK3DwJv?=
 =?us-ascii?Q?iEjkdwR79oSQeYWxCwPPejIritUuB1ZUKm8jmRKyUB6evag0ZSJ6jwHbSt6k?=
 =?us-ascii?Q?qyJk3/JCNGKOCdRgn5VW2/1yYDOvlQKuBpkUxRUqRUSmIF/wv2wJOSdKp+TU?=
 =?us-ascii?Q?0lrvc7CPkVZOpLk7F4jeouwIQT0lC2hY8D/dio7yrTFxaw+aeHznOlFNRYjV?=
 =?us-ascii?Q?TKHXLAKngRu8tORnDuQFyrN6KAlnAkME4+z9ZJQPqLW8t4Mo4aDAwId3muKb?=
 =?us-ascii?Q?Ad9josWZPilV2Bvk+17hsGajAvsAH6DhfOeGTrCcUV0ePy/Yg6dkK4+89TCI?=
 =?us-ascii?Q?fpkwrdOKhsQFLlClKLG3w2Pbu/E1/bB5MSc/x0wyCwG4ZSyCNF0FiTGFVbPH?=
 =?us-ascii?Q?9L3HwXkFWd0zn6k88uxiKS+OtaVjXS1Be4R8giicKCVkUIszK/bWNN5T+VFy?=
 =?us-ascii?Q?uCV6rEs5Az35KW/N6/1WOrtu6U5yEE+QqOYqvIsbFuWTjv5sjhHUsAq5mH41?=
 =?us-ascii?Q?ZwW/CFO2UyjCVRW0mdH4r9YUGysaQSr771OaQElnVQo6jecjGHGd6CNrHb7j?=
 =?us-ascii?Q?n0BmFM+Vg+/QE3I4X6jH76+v8NKBLlgj1QpMRsytqhGFUVbmB4sFK4ufA2Qx?=
 =?us-ascii?Q?6gHCEcCljr08/egd1diGPkK1jVs3nbyfVBC/aaIgG6KB8OigXUL5iNBEFjUW?=
 =?us-ascii?Q?IFKBtQKfWqBkFpgA51EvdII5KTzELTZReVgzixcvJhWdNx/Qq9iGFdGv8sQC?=
 =?us-ascii?Q?YytPh7p+8kM7wqeRyPIQ3qEiI8BLgAoEBwQdHGbSRPseqLbpZ5haZDOGOrJM?=
 =?us-ascii?Q?E1u1vsLNxDtrAV0krJCJ/xQSLDSs1qspCJAodAIpGmbURe0qfvChx+K0nS6E?=
 =?us-ascii?Q?etcZLQkH58s4E9A7SmSQe/x4rc/8nbTBKtVMNfqueEuIt1ywkt1u9qh9f2L6?=
 =?us-ascii?Q?izSDdnItyI4CphYGRwKw2sjTWNl5jwYYdO1AQDa3/+DWSq/tTZK6fhcf73eB?=
 =?us-ascii?Q?WwmbeUOy5AcmNQcT7HU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eCtHNeWZJHB1XxJoMoyaD3pldp7I7hX7eFpPn274xV3B6ghX4JRLpcZFbjSO?=
 =?us-ascii?Q?xRvSzSJTcZ2cnW60rKCFOu+98JAB8j07xWdR9OygRbVPWVCqrxoU5TWDM1ON?=
 =?us-ascii?Q?NJWEo65v/cfdxdzDviUniNIvpyu5d+dWof1fJiSe1hDQds49KW2UaSIastLE?=
 =?us-ascii?Q?WOoxkONanP1PNpKIxa3OkJMdAenugnEdETXBIBe6H3JTKe1NvzkpQh03WX/Y?=
 =?us-ascii?Q?4UVtZldAtBs1oLi3AY5sNrjnM1BVkoGQaA8Y3jCyaYuHQ3dhBLwDUpIA8V8W?=
 =?us-ascii?Q?TE1L1JOcJo29727cakSKkLoDhETpfAyRdyStbMlyFCFZ7clRyEL/6d2TtzRi?=
 =?us-ascii?Q?EyUGR9KAhJkUWuQh0s3tEDUpVytBjaOvR5E0JklvqpZYuNQ6eyrpaieRNGyh?=
 =?us-ascii?Q?cQVdWkfNq8wFHOiw0vlBdMqtzkuD2W36+ritq1vMgZZFfQcIBK21aAx6LTsH?=
 =?us-ascii?Q?FcGwz3MFBtclQHV/Z9iWHYEloSSGPR6Qf8Ax4HefWLCCeI2dtwXP4LPoCW0d?=
 =?us-ascii?Q?WbGnpCIKaSeDrqfoEV+lcwTBTm8OjQd2w8ZEJtnXiFB0Pm4ErxWAwfoFf8Ef?=
 =?us-ascii?Q?ZHwMqasSsWak7CEnrdMUCAZDQJ+X7aqjgpu5vWBiLPp4vGpWFM3sZcjJzRKV?=
 =?us-ascii?Q?YWgg8NB9yirkxcCdW0mqdo+e/pujMKLkxmOq1hSIHTMYEosM/4ImOZyv6HDI?=
 =?us-ascii?Q?5T7bYFC6IbpOwmD3wcXHQgv/pTlruMzufO2SN1KWlG9AwYqrucN96lINrHv/?=
 =?us-ascii?Q?CywYEV6Aqb7t5xWdw4/1iuQnS4V2OzdbgVt9OPdwR350/+cACcfNXChYueEr?=
 =?us-ascii?Q?EZSxptrPgNVmlrCVxDMmrcl+IJM0Ssbsd79Qbqkch6n2cVLQe8B5/QuVzifH?=
 =?us-ascii?Q?JJihNPkLUmOTSGTjXHepp4WFiJLdNJYUZahfaPOM+eWrQQyIQA96W2LQN5O7?=
 =?us-ascii?Q?QekolzZFd0HjkGOL3fCkOsI9Nt1kH/yFYDPAZkJmA950ap6rM1IsoG7ay8/a?=
 =?us-ascii?Q?udUfl99ROOgUMDO3qT3MBQKwhqKaxpSYfOzzPTkKc78S4+F7bAjxV5vOQSdz?=
 =?us-ascii?Q?7YHX4btiJdFUj70xLW7SZR7MRKK1JagkKbOwBIvH7NCAChknsP4Qyf87YRAA?=
 =?us-ascii?Q?xQALDYmjPwRFJho1ZZJP5NkO6qIF3HHnUijfJBh0CMvG7IOmCscB4Kj76tiv?=
 =?us-ascii?Q?ych93KGGtvaJvZoGmYrQBI51b70Ct6q+ATqE5hrk4yyUcK+UcQB8WbDJydoq?=
 =?us-ascii?Q?r1WteZQDGP5AdaAdEnh3l4UvIRNfmSP3qP/mEdWGhsVLOGn+tbuHB+VUg39l?=
 =?us-ascii?Q?k95Z+wkem0PED0DK1+73WJFLZLWjex46TKN8D3LHBdFHmirqMQkqtNoDAl72?=
 =?us-ascii?Q?O96SIhouGGwDnoxrhjEt6Q2j89S5HObOM2qdWzH3XfVmBLjtG8ilxbQvNJ4Q?=
 =?us-ascii?Q?RpUZ69WfSAzdJw2y9JXUEbaX8h8gyn4ow9D9VAKI9xvGtlTZxJ4jWUR976ve?=
 =?us-ascii?Q?T/xYszKONvNOq/qyATr7ukZyZ/vF0MoA1iw4JFJqLL49pBW7RQaW1kB9t9W2?=
 =?us-ascii?Q?krB/AggPGJVoGTfyJOm4Wad1d/oGJ6x6RTo/uDEYZKc7ksDFequ083mGNJ9s?=
 =?us-ascii?Q?MNeEGzAtOLF57vcaTQM0yjVfIF2mGvAK+6JdKdfO1FiVM3xoifsNYsPGuqOe?=
 =?us-ascii?Q?c0HrheDpPYaptY2bw1ngJjRR4Q18BEkErN4ESWnnR6yWzYtodHt1NFSblLa+?=
 =?us-ascii?Q?CZkp4xmyTw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6ih5ePk2fuHIa/0J1xppn6fvoqKd491KG2Qa4wNaXwLWWWqVVhsCR3JzKFufRUw8h4h4sddGH7XqClgdDbwrGs6UGJ5N7J7CJsLlmGb+fIwEogZDSoWWac8E8CE3ZQcFlQqpP9NKddCISWh/FSBoXqyyhdA8+DFa+rjHEBoSt/S1iqGZZ5vPmhrqqkMqqJxgf6v4Z8/Nf9ERHEWCGUB7s8oDpmP04B1b6MIfNQntaqq95tyC6MGc9uav7z/PoIX0gApfOwLvTX+Ihb0RCrjBFgwXqCf1lvfF+hp7L6CLySTZvCNxpZNFS3cpqGKVsTnh5blNpUqoB8rEHINhZzWPAKLm33QyRGGewm7WEaoPlAN9FWs2vZ6VDaDMgZeZzVG6NoJ6lZ2tusanCa+9XHqzz+0JZAJoB4dhVrAM04xzkM79BIQvkKG88mpS6hFGq49haq65m8FDWcX44igsJ24qmjYCOn53iVolSpLshrYn3deMX2x8XpMv68rVb/PMxRaCVDx5Wb3HGURvpQSeoLLEsTpAgH4+nBzn00niZ2aNOIFQupCyfe68KhVJ7JnZnwUEdu+mF+89ovMVyDndwWCgSpr/JnqGBLyPWXD3j96eXC8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84948d7b-08e2-4a66-c466-08de5da35dcb
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 12:55:36.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tqe+ILR28p9px/NZWf9DZbYCrfhCW1jzr8Ud/2342T2bC18A0gbYCBboG+jc3e3EywLDPWfl3VySaTrRKNr5JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270105
X-Proofpoint-ORIG-GUID: 4wMJDVxXjSbnojEKKysQDD8H-8E-mhOz
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=6978b5cc b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=rvu6FwZr9-zud1xDMDQA:9
X-Proofpoint-GUID: 4wMJDVxXjSbnojEKKysQDD8H-8E-mhOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNiBTYWx0ZWRfX/ZhSQKDiRx3F
 IUeKM00tN1Tmc6NL0hZJw5+ISxljDZCZXVW00lE41rxFTRlRAJim/MwsovULdX3c+0PYRAXcIbi
 9evl9GvPVjqcjiaziopGTJFmgb151vsjoJwYTC6CvuoK3WUMalA3mz9iAhPJuPusk/GwrFIZij7
 h+VuE5oglhhTw+ga5p/cIM6jc188o1TzIPvJPTbP1h3kw7z4qD8Dfk9cTDknlpSkn0ESJoA4OJd
 unJEq6bBDCGDomKB37ISqCeAUYzjjb5OP+kkU+t2fNLNoAlXmlCxNk61HqhzX4AY3JYZCkke+11
 q1aV7nei5U+Dp+ycWJNa6Lf2sBeUYkZZp/1evD5ypVvbl8SmtPAJhkXgFWox5kP8yw90sWL0cZf
 ye4V4u9BoAoitqkMLbt5w+qrYjiI0eGVnNwixKPVo2tQQFYk5ZaS3gkW/pnpFuY83eP3Fq2f5Gi
 FfXFLimpCuLVdShX3ow==

On 22 Jan 2026, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Some tests check for empty probe descriptions.  In some cases, the tests
> relied on the absence of any read* modules.

Argh! Sorry, this was my bug way back when. I don't know why I thought
this would work in the long term...

> However, some kernels can have "readahead" tracepoints.  Tests expecting
> no read* modules will therefore fail.
>
> Change these tests to ask for readfoo* modules to ensure that the probe
> descriptions will indeed find no probes.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
