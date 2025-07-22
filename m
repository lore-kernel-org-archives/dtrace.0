Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A92EA73F
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194018; cv=fail; b=fONmKRhSUB1bUCmzPQJob5da++ZiRjTKg6AgyZJ7jpwLbVWLYhONwhjeks4cOqJW5eFRw1drSheE7y4i2N6lxq4Wl73lwRHchamXtN21Lcwjan/IKmjhVnpvGFsxR4q/mii+EM3Y7ZY5C7vGMTopuSM62Vgvb1uw8gUMjiDBA1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194018; c=relaxed/simple;
	bh=I/mUypQCX+0KEymWKKkpGdRnLBJCl9fIcwG8rsJlLIY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=LYvJz30sIzdxtsd/U9Rlw9T2gydXqrxhCXlZPYMBUghMLfizGvzVGSe7hDJMPvFhc4ZMYS0WFjPLXKsKHd+/q+1gk2shS82FZ1rX5UdCVAvI33xOT78NhSQ0z2yq9oJ5JhfP+lOp9qEkGgFZDHnXX+sBpdaPxgj3OB/2/FSMT5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IKYfyMLP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XzhjKHBe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IKYfyMLP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XzhjKHBe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDnDW5002501
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=l1kTJIPM5ODj9PLlv9
	09G1Vby2OBF1qoeyuvZX+ImZg=; b=IKYfyMLPNxMf235O6NxS2xWCHn1/pSF8Lm
	vznrP3eNyUPIbQZ2EVxDpSPMuLBAQeJHDF94uBnmuyEv5sQJs7WtMCtqOKay0ZZv
	ZqnXdpfooZz8VD+B+jPbns/VOdBNOz5NcZ+ueO7lgUmIj0qesaI5B/6irrSlNn+3
	vrWPAXNLxlRxej1yS5jWdivy18a8NeHsjo9gJ1sSfzSFcSsNeRQOvQZGB/kZMuTF
	IiYRzRjJI6ITDhnIe8TaPMeiAz95NAwmarDIDmTvrFZdzmB68w61Q6u3l/EVKlzg
	gZUS2t2QZLH/H4MElTtqtsdcmKsoTTUBmqZOL0cIOT41qpjaWHrA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpdcgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:20:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDl9rH031670
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:20:14 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tfp69j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTqIG7G7qoproZZd8L2QPNaW1pGJ+/HKp7qVXnDwVnVfAXFUiXuQACNvqS/AD52qM8ZKM/XsAUZxvJqUTY8cpxCFUeOXx340vQ9fB8GVUsEiZmUr9lKFWTdxBOwlXYjT0zo4g40coAuaoa/NqudrmGqT0Q7sBLjtT5oPyZ7XORvSQqP47UdHSn0p2ZlOZQ4XQ3Tua6CciCj6fAUF7qz69GRGSkpSoxN1PX6H9EIsr7v2SPM3BCGh2C30MtmjZfgxOBVQp5HczdUe6LSiDAvVq+6g8sAHjfxh1MjhYquWcg8d09Rhj0xRCLZtpwERMHtA2w0WQqPWwAxc0MzLHDX7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1kTJIPM5ODj9PLlv909G1Vby2OBF1qoeyuvZX+ImZg=;
 b=TMkEyCGJBwW/v4XDR0xnx1BIp8hJWypuc9RGvmsEx1yZilv8GiEZr7Z1R8coePdexS0WogIgF3txQLkneiQMHqcdH0oTzkeMGjYZymGxLmo5Z/gAGx5zlm8ygru/kRPeoLiuYGBUVNtCJg1mY9DU1QMm+UB2S4hy4WWzTH8jspt8uLshhwFvGqe4QfPPqW2kkczfCbEWPuZjVsm6RCh2tBZdm1DNh63jfmY0QsNYdD3MHCNCIlkoRz9dE2W1it+2bLpsad2OOXHOhkV4X/NXNJ69zubr+73uvHinOIBOLCVuGkRL4reLxh466ma6YDzXJjTz4jk08mj3g22EKwqSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1kTJIPM5ODj9PLlv909G1Vby2OBF1qoeyuvZX+ImZg=;
 b=XzhjKHBeDz7S4lMKyT94W5sC+9Y4VH/Clq2rfxdrA5Y/HXB8ViM6K+Feb7rQnPlDqa/DDzGEpsEFVd12MjBr7x+6eNgRGjFJW0fqUYZaXWGaTA+frl69vqP+N/fYfY/Erf5So+3IWrgd0hTyUtOIhG2GbfVe30qzWPpGQYbMxGE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH7PR10MB6155.namprd10.prod.outlook.com (2603:10b6:510:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 14:20:09 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 14:20:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Make sure all probes are listed in default case
References: <20250628011932.23469-1-eugene.loh@oracle.com>
Emacs: well, why *shouldn't* you pay property taxes on your editor?
Date: Tue, 22 Jul 2025 15:19:59 +0100
In-Reply-To: <20250628011932.23469-1-eugene.loh@oracle.com> (eugene loh's
	message of "Fri, 27 Jun 2025 21:19:32 -0400")
Message-ID: <87o6tc71f4.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH7PR10MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: df62d26d-6064-45b5-4c4b-08ddc92add64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xr7GY0/2cnAj544JT9A8bAkD3hPhxS9jPeU2adkY78yZTS/8lDnw87Z8vka3?=
 =?us-ascii?Q?MjjyKjWsnIKbLBoIBBsnDIyY5mJLth4vUIPaMH+7y6GL2CSGwM/HyzljFsce?=
 =?us-ascii?Q?bnL+LzZWiRaS6aOTiA+tD/1fczPg5EBU3ymtY9bojd9KaWxjsb/ig+H7HiLR?=
 =?us-ascii?Q?LiBnp312AO+y0STek6LoS+dAuobH6pRuHkdPM/R12fWoMvpGdWGUOfuGh7AV?=
 =?us-ascii?Q?hKqU/jdVwprIikAXZt8rXDyR2HdSCjSoW7TTzbAKYcQtumaZDPSUUzjwS57X?=
 =?us-ascii?Q?CDY4ox7B2rCqJyo+7kt+Cyl/rb5icFiD8H99cA1/piWqP5iIwfTMEhVYz+jB?=
 =?us-ascii?Q?1xgurujGSB1WOxwFY60ALJV/s7U25BjGrYPWnZeJWmowlnjfbHaRg0AKgO/j?=
 =?us-ascii?Q?5O64/PfLsN5Mm1Oz3IARf6n1X9L0KREAn7/MpoV1PPGkojtweAprLGK5iMO3?=
 =?us-ascii?Q?BEGa5x0GIn0Pw6+hbyV3n2AkJc2fGYKqrqbKxA+e8HT8ERJ1Tfgh5dkHqVvt?=
 =?us-ascii?Q?PE3nagAG3wB89twwBNx/qe/IbFbnvH2xLV0h9bfSzWtXBfIN6oJw2BXHVzMa?=
 =?us-ascii?Q?9a5Fc/wGws/O0XIlVik1SsVNV0qPjFO+AQLr4LDb5wkaXP+pIcAa9CRD+8wt?=
 =?us-ascii?Q?noSfa5fmszcpZ2EFb+ukc0Xu0ITpT+fdEmE8LQNlNo6fjuhn/cD/q+Z35ReE?=
 =?us-ascii?Q?cvSMWu5tSGeK1w7wAYgFvoa+gJTfIqVypfIpMquW/UIqujbq1Ew5645ZiCGh?=
 =?us-ascii?Q?8yTUN0M/MZbXLq7fwMLyxiqC5M4zeEf99cSQyzRMHwOiELHrTN/5Y28CAAM1?=
 =?us-ascii?Q?sGIWcSLCHS3jQmJXRB3mYQEIku/usoxB/ZXMatearzYucHQqrxN8SL+JufVH?=
 =?us-ascii?Q?plBhGqSXKER6KzPhBJ4CGpLE3Ec98wsoYStOsgMMdiQAAeaUPJYNqZD9A+Tk?=
 =?us-ascii?Q?NYH5ixkaFaOSIH8b0mLd3fve4YdPx9aCE6MQ3QGJY5XpO1FeWzqrndoTQil4?=
 =?us-ascii?Q?8+2up07VVmGbI6VlIcXzw8X6pS22RJVZ9gFE7XHT5smMBKwxrmh+PSbPIv5v?=
 =?us-ascii?Q?ecgcHHmyExNxeL7Uj85dg9/bvKIciXebVtuVOSUaP2f6gYVLGxKUgMs4xxb0?=
 =?us-ascii?Q?iW+YgycMpb+qQ5sEiHaYPtXviGw3VaDVKiVGvFd6Bs2NfuHZzWOWxHjvb9Y7?=
 =?us-ascii?Q?+NvhzAsV86nNpvF3r+EbrRrisOV7TR5710ZfbVNDDvrVQIPWpzJ6qX5yHjE/?=
 =?us-ascii?Q?sRMBnDnEt1Y5wLgFRQG219qUqCtGw2wUPopCSPBkTrU2LGEv3wqvmrEax3u1?=
 =?us-ascii?Q?uXlGkrDnxvDVvOMirViFva8QbU31jMRtfc21UBd119fRpkQr/j997tk4AnPK?=
 =?us-ascii?Q?gTm3+GxCIcPVi2JbMUjPgZlmAeo2MOMMchPC2BZ+yXmXbX3j5/u4R7spWPBV?=
 =?us-ascii?Q?jDHgtwjzkNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NTj+zwjK+Y8I+7c9UtVHzVK8wyCJT1AIJSlCqSf0qC14Ne/wafvzquSa1sH3?=
 =?us-ascii?Q?8XQyozLJFwUPzlxKAkZVcxn5gaRO7C5dKFtraoPXbZuSoOoxmehPG8w0XXV/?=
 =?us-ascii?Q?qikul91ZlnTJQm3DD7ndxaYi/GJLSJTXETLX3oCwG8CR+0a00oBghW2p1CD8?=
 =?us-ascii?Q?rW02TlW4RxSoQOoxJa9Ixzg/7xIwSsDcBqRfNDvG0pgYYhei9zhND0/6OlwE?=
 =?us-ascii?Q?Bp7oM2R22IB89FzNU+4gQwDTMYcglmKng8cR/m2J6f0tR0lnWjhlYyC73EY8?=
 =?us-ascii?Q?BBSExz3osBPJCM8Nht6/fEKjHbIgwfSRi785soVI51DYCAcdGphMz6e5tesC?=
 =?us-ascii?Q?2Hvq8uQSVjssv+8TbUfqOB0A06r4AgaDBdDNSkkSSe1eHRv75D7XRumlFO41?=
 =?us-ascii?Q?YxtpqR5oxwRRqxixtsSE45khbBvLBK+MLupiFV8turbpP+iKKvNJF3wTeKGQ?=
 =?us-ascii?Q?RFy1hAxunSNERSjJH3HDH8ULxeRvZSXV+6NKklgx/Kc9QgMcM2+phL+ckiuo?=
 =?us-ascii?Q?i7F9YLoP9X9wHlqTthOsQljHLsxtOdqFMP2Ia/IHiBJ+Y5zfnVJbWe3iHB13?=
 =?us-ascii?Q?dnWiiDtyQAKRQgaXaN4CW386aAf2jHDARC/Snn9vhfLIEu5ke80bD5Ch7ynl?=
 =?us-ascii?Q?cH2y/u494CJdnwXb4CHGA710YU3xoGzdDWxH4v20ZJptffXP86nL5l4wIeKL?=
 =?us-ascii?Q?UhZztSGZDXiQqicbJbHqfLgjz9ENy6ojHBhCwZx8Td2v/mVsXZPIue3aJMwH?=
 =?us-ascii?Q?S+0cNmeKFz55LzBWL64osIGJHQFIg16kuCpUViiIfOx9GGvRoJ7nNWbrMDyc?=
 =?us-ascii?Q?MZ0AKXt8gMaEbAz62c8ftAKDKQ1iIqox4OiP5DX0flHfR7Yga9Rwp8oP8aP/?=
 =?us-ascii?Q?mbs19uv3hGwaESDj/rdJ7xb2w0U2LoSctvVhki9sSCI5pxxli3kMZkgJt1bj?=
 =?us-ascii?Q?AwpR3ZB4iloNNvlF0Becn+TD3PfiesrbWR/Nl0d/6B3zStL++MtJseX3K/mz?=
 =?us-ascii?Q?sVNhpeS4kPuQmz/0qPRD50pyMW5DI0ATKThRJ726RCggKc8sVBEEUJGuGWSl?=
 =?us-ascii?Q?ELvBXQ7oOrON+Np///pLmFAp+jMpXoRTGtdOIVOvHuShsJckoburMVDFxWud?=
 =?us-ascii?Q?OA0gd0DBrABvCw1GidV4R38WNTjdB1NXVrp0dcm0S+g6vZlU5wQs8nHTNsyd?=
 =?us-ascii?Q?7MDfgzKEOp9Y9oncZH0K2jCDsFPNo5V9fZhcgZqyBIU4l0O+4CBiNE1wLjxE?=
 =?us-ascii?Q?Fd7cjcBSvC5UhxSUvOCpq+IkpqxZXtPzbRScsb3uZvqBbMoyzSKXuMc8C1G3?=
 =?us-ascii?Q?1UbfawERJkYv3pWF2wL/5wK+oyhCtr7KXHdVsYk5arjSaX4sdD2cTvX394zf?=
 =?us-ascii?Q?MvZTAjFCrDAiJigm4f/xwSW5czuYZ/7jLjGVQ2DjcVOoTM27CA1VwCBBWe1n?=
 =?us-ascii?Q?Cgkdfi23DMfFa/y64fv7mK0uAJmhG8z5Bq51vnKxnn/zTWrB5p4/Ki/5TJxx?=
 =?us-ascii?Q?MzpLvDm9OZKFTX8xw7GgwThyKfptOa7zDBINIz9yh9+U5jnrKl3ReKwffokX?=
 =?us-ascii?Q?iRp12VtfeKJsyb61tUg0AUX+jJV3AE4WJ0N9EMOxVnr9jXPBxxsLshP7afMK?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nJRh7hzfb+yCJcBWZdCr+mnxc0Y280Y+v7UrIV1Vb70K9vjloqDZ4uo1JAka5I0VM5I0dfLB8pmjCu8/2Q5f0IU16n+Go6fDGq8njZ9+5nvGc7sj9xrtu74aW08gaI5i0nCXjKnspaph75uwFixNhsez5AhmSQdvzNUImIeE/HSK7sZJdql4HD9i1slsuYhJyMGwLe9UHrhd53NtgcxMa51cw8GXBlWaQ5JEkXX/9Xw26XVvHmmShUPVXTySO4Jx4deFvMaddgrjRhysiX4ZQtgL9U4gTcphXbQE/SUQa3Jn+FFWm0+YIsiosuZKa8g6wgkgxYqrcp08O5MuA6K2XMWtiFN8wJoBH4x/6KL+56QUYK9XPnJhGXoBHebJvZ2gI3FUQq3X+xyplmdtnow1s3nNSqbJSOcIidbbRviejGq0FOFj2kOloJENZkhNEhBcso2mnk7Q7sDhqHiwhSxWS3U3VTdRhhpV8rwZzfgrIBHm6cOa/CFwcVdXb+0u0DW1RwH3DWv+1PBQJoyDrehNDqk4RdltUXr1YVWPwrRurDjmgg+wU3O3Ly3DVy1RsJEpfo16q0T9XVSFJcWpPTLRiHjC9jGFCpVTOTUM8gpKv0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df62d26d-6064-45b5-4c4b-08ddc92add64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 14:20:09.8236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzObftPZNhjacXdpkY+mvBNqC7QWnULSEvAi+slI2HOO+b9/fP89W3t3ujv1q6EW8iI75UTWDzhAtXScbPEVnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220118
X-Proofpoint-ORIG-GUID: HiWjolP442YakY_s_Wi-riT1zgfaZyvO
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687f9e1e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=JADUO7FcbBbaiZetQMEA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: HiWjolP442YakY_s_Wi-riT1zgfaZyvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExOSBTYWx0ZWRfXwF0vtkuBH2VU
 wREnf2HOrwiUl0P+7KTVvKn+rn5Mx/jsXrH9aP0tF75ye7vBZKUwmcPsmbl3VL6WHrbnnjzdZm/
 myO+dkpmqR+rJVpJS8DQwjB718tZTivFkehQuHpB/GF8bj5JI11WYyNYxTHyV1iB8I7ftaTA7fp
 qvoYqdZ+tpvok2kOj3KuIqw67VWpScRr08bcS4OhbOG0/9/lF8PlBJqu5XgUgMreAq+QZtNzHdk
 wV+bBxTP55MgVGRZ2o32ENHxHtnZrMgIaBt+F9mgFVvCBcn7/KILRfD8mu9nxIOSl9KyUVrY3nm
 4xVsbIVW8O39gSGOHg8rAXRKk45Jy0hrLB3NyAC/aNqbTnHV9PpU8PwPXoroo9YDURc95olXr0M
 lPh5HPSrZm1TdWaudFbr/n2ntgpOxzoDIugR59cJ7c0PckeRczf+eeqYKGRS094VysVg3uK+

On 28 Jun 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(presumably this is fixing the problem that lazily-instantiated probes
like fbt now is weren't instantiating probes before trying to list
them.)

I winced at this at first:

> +    # Recognize some providers; apply sanity check on number of probes.
> +    $2 == "cpc"      { mycheck($2, $1,     5,    500); next }
> +    $2 == "dtrace"   { mycheck($2, $1,     3,      3); next }
> +    $2 == "fbt"      { mycheck($2, $1, 30000, 300000); next }
> +    $2 == "io"       { mycheck($2, $1,     2,     20); next }
> +    $2 == "ip"       { mycheck($2, $1,     2,     20); next }
> +    $2 == "lockstat" { mycheck($2, $1,     4,     40); next }
> +    # nothing for pid
> +    $2 == "proc"     { mycheck($2, $1,     6,     30); next }
> +    $2 == "profile"  { mycheck($2, $1,     6,     30); next }
> +    $2 == "rawfbt"   { mycheck($2, $1, 30000, 300000); next }
> +    $2 == "rawtp"    { mycheck($2, $1,   600,   6000); next }
> +    $2 == "sched"    { mycheck($2, $1,     3,     30); next }
> +    $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
> +    $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
> +    # nothing for usdt

... but honestly if the figures are outside those bounds something is
*definitely* wrong (and it'll be obvious when they really need
updating).

-- 
NULL && (void)
