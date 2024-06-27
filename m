Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C11A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466540; cv=fail; b=HYlRBiL+PIWHuqFopUP+mYf58JvYoPuEQOIy2JO0ek4OfZmSwX6CBQhheQQgvOlXptQ4tsP4pDOaoCcmRAgOi+OSxr6u+b9Y4jpiGIDzon91g83MLi5k0o+StjrHACsfEerRMehqSzefjRZCcZl+BpDYj0VhCiTV0zXXOZvZrRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466540; c=relaxed/simple;
	bh=5HFu9YXTD5K5anVFD/x3YODY6vBd6S7rbg9GjfAp1Ag=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aD3maN5cgPGErSIl5VlI6wBBZs7C1GpH6QYlceBf0DrkHMT5yg+dTwkSOUxrNWleY5FhSj4hWLxv99147/TYRzanGy2+WQOqaLqowbgmFI/z0HGfEp8Diw0gVmDudTkf1bOyqcwPz2sZjbeDkWn496nRVB0s9S+Tg863Wj6Xq0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T3YmHmtl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IBQfzdwY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T3YmHmtl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IBQfzdwY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMUHS013901
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=uNtIcxBsQaRVxr
	yZKjK/Zvp/6yzNxe/nRFo2GhCWG8k=; b=T3YmHmtl/O6zpjHgZ8teBENPZdgnLg
	9iXCZ2XMQmBoEfdPlf0JsXtKvPGJOAZ+YAWuFAOB/LiwLZRV2uYD1I7DHYIQgI5O
	k5RE9akFhO2iTFedG05fr8C3mlgPjh5x+PT0UX1aVZeuLJ7YJ3U4PheDtCya68FA
	siju5qXVp8J2KIwbFKI7RIThOk7KNdq3AWCIoPFYqOVXdWYn9hpNNMQNW7WX6zNH
	nxv9cT0vHNuBWOeFfM2Pnqbg7jYShCwU5oXCgg/emOHisYmCQDx7tHLl6AzOhaCW
	GBaDQbdoAZL8JDbY6v1CZ2kwFPXw6Jl4pkOoW/ppbbwxLbgFU5qM2KwA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2n0tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5Us1R017823
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v78a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FurjtVJl0R6dV1KDaGSSa6EbYrHwqHByUtQKZ6559PfEFV2smyIDM9niLE1VPviz6L3xruqPlmsGfTg8mPOO0U54Btd49f24L3QR/O8rPrd/d1QjvzZGIM3l7plcSX0s/9qce9fSAA3fBY7O/wi9Oip94kqK/IGBDJ7hQf38bS0slepd0CgXFf3Kmyb+OUwNsposTlnRbDu5UP6+p/jaHqV0DGr1QVGPAE+JK8NRBpXGt+8hdHbUPvWC0DMW06UGJ2ChinELntvGdtPqQdayldyGTqPZ2OZzAW/FVeFaPtBMjuw/oT+jWms09uWjsq4yv46cB4eM9SNqy5zCVg19Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNtIcxBsQaRVxryZKjK/Zvp/6yzNxe/nRFo2GhCWG8k=;
 b=T4fZLOn0dJ4G7Tfo+YPqrogUdW+0bmPtgVLU4Fhx9UVoIT5coS03nbe+6uEKvrUsdWiw1sCTT6R4Uj8jfmYlcuE7CGHGNFZ6ztklCtIeqFYREGNrWm4zXsifvUv/PRnFYA9dqDCGaFSDJ8WCVZA2A2gfWytadDEZO4jycf1dhjYTtlp5mNsg81wdIqslcZKDAhg2JdPE102CXZINH5YmP4HESlYhCbVA2RMAbRa6yAfc/QoCH/2owF6Bj3uBwt6cKGkV8bqImmwyi+i+vPgNZhilBgHaZiHiHpDp+Mcr5JV7oBJceM5g08VWLvE5HAm3F6Kg4tXy3om9jmgw84yytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNtIcxBsQaRVxryZKjK/Zvp/6yzNxe/nRFo2GhCWG8k=;
 b=IBQfzdwYUPcEZ6m20zFXl7daS+H2hBNLJiTYquFPnOl8bGe5CzJQgc+Lg2hkvLFduy0V70fXkxBSglOouI0F1eptsDCpX6ogs59EB27ozbX6CleI4iaId4Cj1YUlfnp5oM1DpvdUnVMkJRDYD5xbw/g+L6870S+LEwl/CYNwUus=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/38] Hide dtrace_actdesc_t until it is needed
Date: Thu, 27 Jun 2024 01:34:30 -0400
Message-Id: <20240627053455.21567-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 080697c4-f259-49e2-7c2b-08dc966af626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?myFBpoCLBCEAFBRXpQeEvPjiS1tzlcW3AbAySqkTi+J/idOBIghdeEsCiDzi?=
 =?us-ascii?Q?ynqfzXKKvkTs18W/w8/6rnLlLPC1yNrxuFnoluwJtwVWRPezOghANSA2TrGb?=
 =?us-ascii?Q?V7vFxcmfODYz1VRrsNxrux7X1kpnQvHgjyDaR8pek5x16Lyrow+jlyh1VoWM?=
 =?us-ascii?Q?I/53Hd+Z2zGrSvLgc52WHXdBUr4NL07cqN9lntP7JSpl37ZzGA2mPoNZEt19?=
 =?us-ascii?Q?MQR7NyS5dM5TKWovfZ0WMBzz3Nir4optInszfomoTQbaHknZfR0JROuPDoyV?=
 =?us-ascii?Q?IsoOzjhORgeQMSJtKhxxqYIRU6LVDZvMRtkkmplCnQ7N48eAixwUUJaEQWzu?=
 =?us-ascii?Q?JxpecET2rvuklqdlPO3qH5Qi/NOk61IE5+3wC/n9i/M85cAiezOD2nFf+vLI?=
 =?us-ascii?Q?vUuSv7xrfU253KdXx3nBlb/Q+vaT60h/PliP47XvPT9SGLAwa5F+XJGlKdJn?=
 =?us-ascii?Q?ddE9IkOsg1QcIawha04gkvBsPI6wyZKKtISho+PyCcXPCWtC39vOvsSwUyLG?=
 =?us-ascii?Q?Dfwp3mNv5W5tRWpaFOvPsgNXLMDzMS3OOdiaJgWpOk3JiKfdf0lzQJ9tGOKm?=
 =?us-ascii?Q?vPRllUryvO/HGEn2fV6N8UhfYgGxPJkW+igwLBeX3TTvm//WZbGz2GAte9Rv?=
 =?us-ascii?Q?TJCYqenhFBUGHEdxBzaAJXkCxQy6/w/pgPhn26LGOccFg9qC5+cGS6I+qDug?=
 =?us-ascii?Q?JevEtRXP99CFf1JmLQmM/g9qb2/g3oxuCFiSnmeUe4qM0rKxM0UlnEqE7scj?=
 =?us-ascii?Q?fXkN+Pe8K09+AbH9Gcl6FZMmkm7IB1Lw5r0bsVyPgYKxRR+83nTWR5IbY9Fw?=
 =?us-ascii?Q?02mc9XADegh8CqsPRRpRBfUQFqNHZOV4I+WKTDRbMeOwlo6/HJ+YriacpLyo?=
 =?us-ascii?Q?XRj/blRTvdkkZQEZjW3XWW8PDFnX1hc0dwvQ4bSAYyMBbV7/THYgJ84wW65U?=
 =?us-ascii?Q?VUdLS+jZk1/51S6yLPjQxHBcW+P47P4EuY+cDBEg24vRHQl2dmQF8YJuifod?=
 =?us-ascii?Q?Z4HlCPCM3jAp7DIOq2HXdIzFk08hnLnuKE517aV52/Y1zI0QK6TzHNBDq4tY?=
 =?us-ascii?Q?WujFFSv4ktEi5PYrJ24IAOxycJqBWEdPAZTlxCy4QIEAESLPnINRcTafvaIo?=
 =?us-ascii?Q?YDpXTQTCcs++PLZyq/wxlAUbLPAnIRHtok8Nes9AMLHfaxYc2X7fSgnWX18b?=
 =?us-ascii?Q?HD0w2zCnGdppmlBRjr7H82Cn//0ShJrgvWv1zD3C/lfpkFpBsYa83ftvmrWt?=
 =?us-ascii?Q?GMxEO2wqx4POvFH45bupEb/zYtSJS/k7+8VCGD1XM2GEXoxDuolCvs7Cl5QA?=
 =?us-ascii?Q?9ZWwtZdjH38DjqHTfacSnrE/9w5yAlvEgwujiW5/jwhSGw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4SoiGovoZ5+GdG/5uxQGXi8VtV96G+UHlT9Xa+XcA5gxVWfGhjoOZG9U+Avn?=
 =?us-ascii?Q?aRdNIDzgZRYl9p+/JQVi8Qg+raFW9Iakd0yE4WtVnKRS4SzMJB3/CX1vIwpR?=
 =?us-ascii?Q?RBxKUbYbYqE2ZH69ZAMxaFI4eXrTSB+DRb6/GF9dNl3Q9fzICxAxakVBdowU?=
 =?us-ascii?Q?KrU1p8Ua9VyPrIw85UFXT7lDqyshoAGOx6QgUxLwEZTQpMVuxm7A/99lsMEF?=
 =?us-ascii?Q?ZqTOiHaTdBj7/Iwx97Gq8HlTMAIlc+6iQzi0QSy2qe5aLcEFAQie8kiF0kd+?=
 =?us-ascii?Q?/uSPYkKKaysOWA4jUOw49OWxJnCC1nl4d5D1aUgxEMZZGFBwnJSQA4IG6i0N?=
 =?us-ascii?Q?+Ohm4lHSVQjSaUIhSUjPE/OTb3OBI63FMg7FOarcJzwTYfqHOFdX5IQu0IIp?=
 =?us-ascii?Q?cp9Zn7IvR+3QdkrPDJxQm7XtIxUhF5RPtogKwYON9loZHBGLQbNqYvCvkgP4?=
 =?us-ascii?Q?YMMzbdjjvWGbKQX1lUoyLAlwoG4cuqm/thf6thsUEGpwqrTiq/fvGcvzTtJW?=
 =?us-ascii?Q?0dHYF23UwsqkP0XINq19XolD/iGxDx68WIR68x7yPye4OiogyOlvY6e2cWBn?=
 =?us-ascii?Q?9loaMyP6Gxg2yEAaapQDEPATbrQPWEb4Se/SKWLBUppomkktFeN6M3Qj1yTZ?=
 =?us-ascii?Q?dZ9UE8sykoX+NmnhEETjSHMCWc6jSF23b9GcYhJgyDH6vu/KDJW8aUWPPdDi?=
 =?us-ascii?Q?bfHjGICO5u01cytZo6U71EzGHN5azQrUIhpT+tdkJPPwsShyWFQzFIVD2Igu?=
 =?us-ascii?Q?es3h2TGZpHFH3Qbe8Vdi2d2Sjp3KPhzinc34QaYqKgvqr1gZlpvCpC3l+cdY?=
 =?us-ascii?Q?T8viVgPudD1XfhD5GVy9+FzNwAhcoQb8UmCJ1lQk7dbJnzbPYVe4adL1s/XN?=
 =?us-ascii?Q?+vQk98g0wwJxuk9dyzDoFEJxRxWUX+22viwVuEyZSQH/7U7WkILWnIuruNj8?=
 =?us-ascii?Q?iOpkYrTDi1Wk9FFLh5eHJJUUK0Af9RAlehBLGr1hekQ8ivbbe6/FhNWzsijh?=
 =?us-ascii?Q?c5xHPNJywaFH5dWl0x03uoaNOV5yQb8cV1EX1vgjrVpFz/G5Yu1ey8ap/MHr?=
 =?us-ascii?Q?EEdTBppguDKjH/taeUsD8LurE/dnzTU0dfv8es9DnE4fd0EIujz12qUdwJAi?=
 =?us-ascii?Q?b44rKpnyPbzDueQjGZiAquizIo1sCRHlDgZXCDUe0KibbQNtTpM7PFJ/e3w7?=
 =?us-ascii?Q?KuKcYxhQVHThd+p4GppDuGw1oxfmyNAITcFMU5O2vsrXgLWSFSdZT2rFbU2s?=
 =?us-ascii?Q?2jPAYysbwXASHdyQrVF1yrpgqd5mAIySaYAay28+fRl9juxJV3EZ8nDnEF+8?=
 =?us-ascii?Q?k9h/xgL3h22LHMAEAvKAmv+NGJKpQQ05tvkqLeENP6+lF52AgbOi/mIpmSh0?=
 =?us-ascii?Q?+bOVyHEAlzPKC8WRUzXHSodZ4vf7EeE47uha8dtvm2mWvE9PANjYlEh6X8yF?=
 =?us-ascii?Q?ZqapSlNaggWGQahk/XQZLcjqeLNpDHDOCtJt+taty0Q1+V7GMckgmqxBU9P6?=
 =?us-ascii?Q?uQt03cCctXOl3yTBgmf6XvRhPNfZh9/7P1aZzhyZRCDP8KcHTxATIumTQ/9J?=
 =?us-ascii?Q?/GydlvGVDw9Iu2ZfkJckxhjO4Tif/kLbzCsp2lYC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Zodl2r6p1/3A3e5IvnN+0bT5w8dHfncFI4Dy2RbrwgkThM88pA24QsNIGDM1QY7lFOSrZTCSMCRA2VyKd+NUZ8h3fvOqjQfhPTHGSZaHplKgq3A7rqjRLVmn28RGu2blOKWXU9OK6ATvlEzBJpAWRM62kIxSr9Anadu7/9hvOBcPcBavlB5GyYxTKocVXmsQj6dmmn9Jjt0ThuPLtifY3wLGcwkaqrmr2OFWsgoUzRAuHq7zxhw1CeGuChVD+Cwfyy+MaEi2DnB62J/rojwj6R0zX/9kWwbLqo7rGnq8HqsYkIbXBwU4sP1jIh+NDG1MikpJl93p5QBDI6MwwoIAM5Hm4zyMohEIEG/Wc06jNeyPR3Hu+7T4r5Zbl660e/sfBBQ/+WeeJOD/lkqqtTWJ1g6reqssyQn4nOEb/UnSFs66PxH/zLXJr4tbnpdkH58vNPh1Ji2wUdPTBsK8gmBICbNZR1+61AdlVk2f7RKcnVClIzNeIK2MgNmpp4v783SUhOUewrbWd7Ub8OjIVXlJQp4xC+Qxs+1WtKN6UZOoWmIeTL7H/b/KG3AnK9Fl88vX0A58Lt4LzfMhYyxbgWhJyOk76ja6gNfVbp4fRvAk8Fg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080697c4-f259-49e2-7c2b-08dc966af626
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:32.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRhk5xI2zsmCxKMnIlJ0Z7Och9uODk7Jk8PaFyblXheZ5XeMOhbUrhiGFldEXF6f7s23u6CZmj8HCpRC/j44GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-ORIG-GUID: XF1ChFscgckC2ElO0eS6HUzfNN4lCHxE
X-Proofpoint-GUID: XF1ChFscgckC2ElO0eS6HUzfNN4lCHxE

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/enabling.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
index f1ec444c..2562c87b 100644
--- a/include/dtrace/enabling.h
+++ b/include/dtrace/enabling.h
@@ -43,6 +43,8 @@ typedef struct dtrace_probedesc {
 	const char	*prb;			/* probe name */
 } dtrace_probedesc_t;
 
+#ifdef FIXME
+This type is used only in #ifdef FIXME code.
 typedef struct dtrace_actdesc {
 	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
 	dtrace_actkind_t dtad_kind;		/* kind of action */
@@ -50,6 +52,7 @@ typedef struct dtrace_actdesc {
 	uint64_t dtad_arg;			/* action argument */
 	uint64_t dtad_uarg;			/* user argument */
 } dtrace_actdesc_t;
+#endif
 
 typedef struct dtrace_ecbdesc {
 	dtrace_probedesc_t dted_probe;		/* probe description */
-- 
2.18.4

