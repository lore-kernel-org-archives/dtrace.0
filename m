Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC014532C
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803421; cv=fail; b=J3t5nDQxRDkuAqTuCVD+zrNPVlXQcdk2mXHp3iOXX17lz1ri36auZU+cuRejQzHPjW/CjWKtCWs3trwE1/TaH/ugRM6m+6sbiaoLJ+PJ5mbgBjauENucKe5evXUw60KDhfjGtY54euPd+799aIbFP0uTFt9uYUaFjIkzqKBx6xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803421; c=relaxed/simple;
	bh=Aov7nj5/eGfhE44mzJ3WGXn/33OHivxf+O4eaMO7ExE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Wn66Sam4NqJ+OXONjshUAAoIOtQqGpE1BgaOlsb9SsJ/8DO9Ndoxd7T4OIoKf+tT/04A4eQGw+BXYfS+WyEzXtcP3BKGcLj1meDYJsen6+xhJEEa8ncGRVvxIUUYFVPQq2/4+FCU9s1JgvOfmtz4rhqZH4RFfhuk6HNJvapbJ0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lZbKIWym; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pf5kj5SH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lZbKIWym";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pf5kj5SH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1tYjB019051
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=MfdEtQY2MrnNxT
	/sBjOKZLRILBUtpgmUabn10VDUjro=; b=lZbKIWymjw1p6shWkFMPLELMyobJoT
	Y5NqvNVHb6SGOXX8JkDXWVfuKTCyz+HEkNCc+8LqrITsD+IuImLBQWtcs+E+ckMW
	IdGSrwj7CuDhJtTQF2nn6qxTkdinloGEGL04mBZbgr9F+7/O9VCJ8nptMFhkqRZc
	NaTsxdAY71xDl0YFjGh4JoDfJihvWpsX+qk+tZzvAlwf0m60hn7qshdXeIYQyugG
	qgir1l6Q1sEm7TE1nNALjc2zwGTgjMl8xqJ+oQCTZn4nj5J9qviosGBcGlPUUCu5
	ktIeMEXGeee1TQ0EmT6pZwsu4iGfHc5D4+tg1Fv5GZp/BfHB3csVKOPg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuj9js7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:23:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45JCGrQu029176
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:23:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ys1d9knuk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:23:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naBW+h2C9ridDqfTuGd4ml1jm5cb68pa2meEsQzG1J3RcyHbJSD6V43BwVf8Dhxj9kQmeYK/Idh/XgfagjjZK/Nb+IjQ8U47Crld5tvfjVUQxUAh9SgJxA+YxLYcElqa9/UOG8nmCvNZCT6EdVT/UXWXXksCNtStyyQBmC6aKj+v6gN6kbI2IL1CGwKFXIcMXDzTREri/ajYdeqZuGFIvyQQori2qplZavzWWgQx8UMxSy6eYHajhtyATmADj7NiQd1C+WQ/SVspFMwRoOVJ92jw4eoiqlzVQw/RXuvnsH5QQpvepOS/g2tGSipkEVEPkf2iGM3/6s/rIO5VGw7P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfdEtQY2MrnNxT/sBjOKZLRILBUtpgmUabn10VDUjro=;
 b=JmpF6YRGsbjWENoEXePAAqUtA6wZOAajK84kAY8FXZJgctLVoukUBp4ittJpp+F1YHQsixCa7u/2NCngL/2gGRrZnj+FSOoqvf6xQ5se5LI3Qy7bT7Lk7KWlg4Q+bUyjeS2zqniMhL7F+zZz+AXZci/t/v4W9pzA4NykU3zsN6DELF98PlT+7OSeBhWRENuLND8qWSmEfsG8+fU92DpaY9B/m8g8nF8QjpLrqK68Z+s1SF7mVTD+yLXEWo8C22mvZ6Zy6WULnfzVgNPHlY++5rZll/2wHINlNpqrNC6JqoLP0FGpkkOZCtDtH7N8EMX2zrVozBfna6amGy6HJ7I+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfdEtQY2MrnNxT/sBjOKZLRILBUtpgmUabn10VDUjro=;
 b=pf5kj5SHPoPIXOWw1AeWkcfp3pvwHRU9u3w0R1ZE9fLc1D1/G4oVhZ5JBUiiZ7zS0drILFjCeXMPcNLsZYLd9mqxgmvKq9yXp4SH4Yz1aEfrctb3SvtbE5eN4HG5iRX4mDMZlj5o7Mr2hxGct9DpvR+5zplnJzMIKsuHSgDi84Y=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by IA1PR10MB5994.namprd10.prod.outlook.com (2603:10b6:208:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Wed, 19 Jun
 2024 13:23:34 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 13:23:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 2/2] dlibs: pregenerated translators
 for 6.10
References: <20240607184155.316904-1-nick.alcock@oracle.com>
	<20240607184155.316904-2-nick.alcock@oracle.com>
	<d4a067fd-b403-4683-86de-23585b922271@oracle.com>
	<1d036253-cd7e-4ee4-8a48-ef751e7c8a34@oracle.com>
Emacs: Lovecraft was an optimist.
Date: Wed, 19 Jun 2024 14:23:30 +0100
In-Reply-To: <1d036253-cd7e-4ee4-8a48-ef751e7c8a34@oracle.com> (Alan Maguire's
	message of "Fri, 14 Jun 2024 13:25:05 +0100")
Message-ID: <875xu5awx9.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|IA1PR10MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1d0ea0-7aac-4fc5-476b-08dc90630501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rBuNey3OX24sOR60SpnXVNORTZcOWwsGsp8o4HrC3S+bUSdCSo1MzlH6/D6S?=
 =?us-ascii?Q?yEIipMjnfTsT5JRRZ5dF3/PerbS90qJc2G0Cq27Gmv7NF+cpZth46AZfHzjo?=
 =?us-ascii?Q?c9MUN/y6TprGpZmlgckSh9EgDuhuyUi2Tfjphz/ZU4UvnWMn1UtiC6R4OVMD?=
 =?us-ascii?Q?6+AvR8+aN2weqo+nLRAG3/NLdjRODtAnRnk0/EBUrd1lSi3rT8mptNDeq2Lx?=
 =?us-ascii?Q?zifNv4V8EOJsV6lXY2dodilwB+GJ56jsXi9IIIxRtySCmsiA2d1W9+6XL+hC?=
 =?us-ascii?Q?UGvVMptjN0pGqbFts+t2hIgtpC5E/NepaOayRC0o9HEMTWhgYnDe/s3z5L2O?=
 =?us-ascii?Q?bMCNfZhfSrSWrKmRbusGKx7XOVlm6w5R2+oUwJt5+2nahZAnVOAu0yB1+kph?=
 =?us-ascii?Q?/4rgJxMmkjsD4+7a1+3ZOXVLb530BdCy9QEKBqJBlnKi4FIfMPIZUHRXbR7V?=
 =?us-ascii?Q?AhnscnVN1uyk87/ojXRn7flZVFo+tUzl7EvML0+2BqrOLdgP3SCsda4HRdfK?=
 =?us-ascii?Q?Ygep+X3cFxG2rI1/Am31a5vc3GSsgynCdewrKq693FY8qii8G0Qc0nCT3LWi?=
 =?us-ascii?Q?DTS3DTYQW7U6nFILRnbIPnmcqabcgzSvd9uL42jK9+TEmKtlB5BNilpZrWMS?=
 =?us-ascii?Q?jEoigUfs3Z/vvCK/Om/5LxQeiFWkAfgZVpJGFyis7dRXREHC/FVtw5PIbvbA?=
 =?us-ascii?Q?K2aSNcxsbaXY24BO1CRXx8ieb0ZvImJ42IQa9/+eKP22EIHklIR06261ZtzO?=
 =?us-ascii?Q?kSiktAmCc95p//+qNkrtBe1jNbEq4fwBkAanJ+s1Y9JA7kEshnnVdafnNAMd?=
 =?us-ascii?Q?5VjhWMShZz3WvvHTEwwtt6iC5eNDFGvxNe/r+cTFsGemMtPfdKRNvF/DoEdz?=
 =?us-ascii?Q?sJrD/jZqj3WgwPbAXqZDNn+9dccDJAKmsQF1EBeAn1OOQ6Qc08fTohyW+NWE?=
 =?us-ascii?Q?bYk7oqjEpnD24sy0nckITKwDnm2c4DNOWNOlpHWnREdk5nG5Uu9jXOUCSqe5?=
 =?us-ascii?Q?NmnZlZTHOWCSDYUpxS9xH7tbiA9MOmuTm5sOn8tIm8g/xuvjSQx33hq7AUrl?=
 =?us-ascii?Q?qU3mcwUd0ihUoLPU9ERZH0lWF+DJCdYrcUcfAYtcSS+KSjE8c5vLibYtMxqD?=
 =?us-ascii?Q?HbaCR8B6Tp7e9lX431/GbbxJp7oBuu0XiuOTX+YgVzlAQabWRRceVa72k8Ec?=
 =?us-ascii?Q?r2qmltzZBiSRUD8Ufb5ECYvdUzppkKdqvy9qavtiPehYbnTskOI270Posl2n?=
 =?us-ascii?Q?fYnSn9h6Uwe867tL7YJNksCg7yZ2j6L5j0WWFPDawJsduLaL7waxAxbmZEMb?=
 =?us-ascii?Q?STXJUMrSKpye0t3dPQoH1M5f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TlsDFxT1M4vkrfcQXoD2lM5bfRF5zwd2AzzST0G6TqAxOkqgm3vZiTJ0DhS1?=
 =?us-ascii?Q?8Pl+fEobrZ83Xr9LmlUR/YJ5rbC8bB3sE5jNzA+TBJeyxoliMMjxJkl8e2t8?=
 =?us-ascii?Q?oGJ3q/kfzEJoualZF0ki8aoMxLDyUthq2xDtTLJA3UgIRQgHkBs+al2jDXCJ?=
 =?us-ascii?Q?V01cAtcdTw8fONjR8alr7kAWRVjsUIWlCeg9VK1IK1kSV2BXR84Y9Fy4MNUf?=
 =?us-ascii?Q?fn31s4ZakmHQMTUq1dJkPmTUoMfgvL3yE5V2N8IJiuNpdxBtGSE3cg/Y13bC?=
 =?us-ascii?Q?VdKGSrg/Z078+b7rfrRW5Inq3U73Gy6LbURRW2DscYTwiv7inPZ4NElVmFuY?=
 =?us-ascii?Q?qE195/RK3AOV1a1/jI5oT+81c6O4v1sULvJHmA9WVx1AHniexrdrAOx9fG5v?=
 =?us-ascii?Q?/8iXJQ3lENJIbGSGLgKR0ZQ/e079r0r7Br9P62+7EsGEdnlVOHTuRWr7JZLo?=
 =?us-ascii?Q?WM/+F2d4oBsOU/V9vsEpmDQgC9LRgVNzXlhWbdsbqE4NMpPtkgzlXlQnaKcT?=
 =?us-ascii?Q?UIe7XSYIXpLCnaOKmC3li4DYAH7J2JrZBm1wyCrb+7ANYOPjRwmuZmJPQCzr?=
 =?us-ascii?Q?Dp3dUmvmF3aWCMeOOs4g5e140Clc2Yv9I4LpR+nMlzEwEzEGD2LEsYrWAOXJ?=
 =?us-ascii?Q?b5fqEdtfGK3zLl3tYEwSz3qsz8WB4yrGIeRtpi25S+eJbLu4BbpGKImBZzkO?=
 =?us-ascii?Q?KYMI17hrnWpSrNVaCp9fUk7ip5Jreoy4wj1kNhFmaV2SJ0ytIpwlRPentwNH?=
 =?us-ascii?Q?hIJvsDSOLRu3ez9Xv7UQ+g1ucFF6sABRQw68AastKgc4kj1O9cU9ZK1B8BIb?=
 =?us-ascii?Q?/LCRU2LB49q5MYCusCOuOgRoaZChjsHBprF7WpeBA7WvlhTlky+9r0+0SiJ2?=
 =?us-ascii?Q?kafZY1CSVAmi1RHA/c/cFrNH9PAncnfpA/TNPsjY7epC5ttnHlJQskcWCU17?=
 =?us-ascii?Q?FyHszQqv1QfGDS6rHrNY2irgaap3k1BsXe9gGxATHwp4KULA0u/nuKdpNiKj?=
 =?us-ascii?Q?5n6jJ4SVJwYV+3HACo2d5irktB83MHxZLBmoqEGVLHyPFhj/DMg8vy4oMcEK?=
 =?us-ascii?Q?DDddE3iVchyiuFvaHzNNflYxp7MKJBMQJrNjrrVNnhqKWKN1jbEmDPfgf/8h?=
 =?us-ascii?Q?MxFL7B5v8i1HmJFAAikcG//cmKgaWdUUA72a6WjgopvSf561POVhtvPIm/96?=
 =?us-ascii?Q?lJJKFSxUnRK7jE5BOQdF+/5vARIo/GdCg25fHLUss4xkrBf5nbX6sJMVwaD2?=
 =?us-ascii?Q?YnJcSPgBb4xUxdvwzZ0Sn8OHWVw18cqWkjCIfUPHBo4lPa4ty6JfkzH7N1tz?=
 =?us-ascii?Q?P89Wx1Gobb2nZ1/Dy/amD5pGnF/35Tn5k306Ok78JjEnlm9vXRiDPQqvuvjj?=
 =?us-ascii?Q?FR0gb/8clmmF2kGV9fRpfPU2kKHCxxkjVNtZ3WFCivslFIVKCp+zKATqG26S?=
 =?us-ascii?Q?Nfbz/W43B6SMEW/07Wcf0P1RS+5or07bg0rtmzjxyRl3HdlILR5UxNOwbutD?=
 =?us-ascii?Q?mM7+97dO0froqOuA7LfdoEc9raQVJAW9QRMHq1+yM/K/KyalkyOnAjGn69mV?=
 =?us-ascii?Q?RIYiXxtUOmXo9onywDyQLk0J7SAAHQW+OfWsO4iQckenmZvsC2scvIsuz9Qe?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lMGgWeYQr+QhrZTv03FKTtSgN0yvY0xdvE7OmenR+T7ZF6JPLo0Sbu+zi3XYC1/WGaXWLxI6FBUK3sQV4rcENRDoaljeFx7zYmq4shzBpGdfdA/C0mriWcyF6CsJd/R8Rf4XcgFvhO3tkFAfCAzSXnSLAmzbtlusMLntisaF2SNxMyxjdIyvSWytFUh3d7Lx/5KtMs+6ITLg8YAXdDKm5fWplieXSaJGY+0BskYP+ppD1w46IkZ/PE95PslhdQdVvRRZE9T4Rft+aZ2+atdmbSiE4CdpG5VDZ8mDhSdbMSX1UCvQwIjB1Zfd4vSpewzMRJ7fU6l69kg5CNjIB/6Yo066F5NXmb6U+H6c/wqm7OlVELmf2ngqRFamBOCfxkcOIR21hioW7iWrn1CH8YiWNpuQxzNMwopWpZD0Gf7FjrLqhKxh8dA9liP/aKK+m2RgBgiCk6lwXm2kNEbAD3ma6l44GFuY7wJjNTeikouKH7nH7eH123pHcX4X/BW+NCVyi8gTxzhTqRtaeBuHzeZbWduoptKjZ4tSlWKK6Fzqyr3iqnjvjbNZWk9QU5be3PJeEt+N+ozaBNclgsWjaBT0xRzdkKiFQiDt/DFgwdgItC0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1d0ea0-7aac-4fc5-476b-08dc90630501
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 13:23:34.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1fyzWeqC032ZPGpG9aFRMS5zDhZE4btCSvvmo6ReyZQkgMLLwLRownRybKQxgoz8Nx2G5NSVEQF8aukxJ6L5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406190099
X-Proofpoint-ORIG-GUID: -oCCLyR5mKdtt7TqXPZuODX88WX8BvlT
X-Proofpoint-GUID: -oCCLyR5mKdtt7TqXPZuODX88WX8BvlT

On 14 Jun 2024, Alan Maguire spake thusly:

> On 13/06/2024 13:22, Alan Maguire wrote:
>> On 07/06/2024 19:41, Nick Alcock via DTrace-devel wrote:
>>> All differences from the previous translators (6.1) are no-effect
>>> ordering changes other than those one would expect from the changes to
>>> the .d files.
>>>
>>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> 
>> 
>> I hit the issue with the disappearing bd_partno field in io.d on 6.10 so
>> this is great!
>> 
>> nit: I guess defining
>> 
>> inline int dev_partno[struct block_device *B] = B->__bd_flags.counter &
>> 0xff;
>> 
>> ...might reduce complexity of some of the statements in io.d
>>
>
> sorry, ignore this I missed the handling in patch 1..

Yeah this is all generated code -- and the advantage of doing this in M4
is that it means we can do things like this even where variables aren't
allowed, because the D parser never knows.

Downside: it means dealing with M4, which is a deeply lovely language
which we should be using for everything right about the time we rewrite
the Linux kernel in Befunge.
