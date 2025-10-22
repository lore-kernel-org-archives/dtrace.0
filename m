Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370272797AC
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103709; cv=fail; b=gg/KbmVrsrTNw1vhXv/KfQx5VC9jc9sypYqEx2ov/e4sB0jkc/oKXKJFC3j1B8xaOziDWWinVP63xTKknjLLy2N38Rxf3og7kH9T5qINFn5NSR8zAN2hskdp31vofckTs7yOoPqeZIHOAFPQV6lFY7JkROe9JzNVYwvLl+v2QVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103709; c=relaxed/simple;
	bh=cQs4wUuSR91d/aOf53NExL820TgdsOs+APblV95DykM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X8kUUyFTpoqza7vnzZNldNhrIoLYjyK1Qa1cd6exodIRbmzCEC7ytI9hYd1L9FNa7uX25DP7BJ8cFkS1o+OO90xx/1saspFWBy7jFz5nmS5aZZPGY1CbgB3NvN9jJdoTu4O2/y7OqWe+IMHQFcn+zNhc4zVl0gsBdZjBe6lOXwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C1eyAj8p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uKtXpdA5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C1eyAj8p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uKtXpdA5"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NaR4002171
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=h7PSR+MREwaBVyarBn
	or90Bid0OFHS5Kh6UKhViREB8=; b=C1eyAj8pYr1EHbqA/Wf4EKYVlt/9sSr1hz
	5G8i7LSnUchurJ4sPUP6j6IkYfqT8r0fTm+zh3Zp5+QgHzfaA6QL8E8LgNn6Qiw0
	Bp1TfsSiN5Ehh2Z/+4U0eslq4kjygn+tqjEEsqHyqogDrfDWfKXP/l36ODMlwVaB
	XQlCihkjZhbaoFIH5/cMYe3mIG3hV9hNv1UcJLRIuBREQ3mPTykD/sB3ukoq8vIx
	iCPogekeGzsgual4EemMmEOvBiP0GuPnh9Lo8wFrcj4IK1uGkekDuz9lyIPHEESe
	V5GzPyB2xD01avti0a5AJfOuRqemNzF+C6+uC0WrLGIUJOkZ324Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v3076u3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:28:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M22P7n025454
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj4k-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAYnV+qdlJe0RgNucblGjOIux1KfrIGCuZLQL2x4q6ko3YNb6Y17VBcEndsSCsot3vdEkpaSie9OD8lxkxY8FUz3v0U7pUtBrFVQ/n2HiTZouXJBomqYtDLjb8nPjhLqBEgbdlAPVqVUUSf4Vv9AaPaRJAgVRoqA+9FOkv18SJHNdy1dsxQIruQkjgavPT5SjC2XvVPwBKPprHdJrj9E5VOaKdAPBndNfv6mvMfMjgtgOz+TK6Z+ldU3MooQTY+KT6Almmz9FcgbRGaSsNWkSpBzdZSGMhwBgH9iETcfmU7Jx7efNgc0GSgypXp1G5G6J1pOXrJrFFdHUSFdieE25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7PSR+MREwaBVyarBnor90Bid0OFHS5Kh6UKhViREB8=;
 b=AryaEzKuaRZvnMCOF+ARRu3cApTnNdzTCFgJCyUuLljQTS9CDs7iPcC2ZG8l8WvjsjpG5NhIEUy6whlnZ3ngQklyiF3ONzCW9A10GDFdO9KWgZN+1PUeqYtk1C+4yo+xEQ1Rt4/I3rKRtxlJdsYU9gESTLP0P0IcNUwJ2LSbAwsSBunbf0ACo1Kj0mFq7AURtQruN3Dpgv2eBGiLgJESZJ+8J+y0HlAxPxtHsKbi0PNAgK+l6jL7OOpCgaKSq52L9wzXWkN977I6J/KOLxI+v88QyEJ1JDUgdtrA4eC/s0uVjgF+J7ND5Bf2RUuzPpYqIIRSbLoPHlhILOvzoRAvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7PSR+MREwaBVyarBnor90Bid0OFHS5Kh6UKhViREB8=;
 b=uKtXpdA5GKUj0Ze3PoqTqMOGS/68+YzxvcNl+dTxCD6hkI6KtvsJGSrwmKJokjCfkFjJChNuhRLUIak4Bl4EjdY3i4HzT6Ylxcr7Q3Zt26A4pnaVS17dAc+RotRGrvB8inXCLjn5/+jxm6MckkdkorMf0f53CrvIGEGQNf8Okqc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 12/20] doc: Fix anchor links for reference/
Date: Tue, 21 Oct 2025 23:22:42 -0400
Message-Id: <20251022032251.2010-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:510:325::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f7ea1b-24bc-4525-da0b-08de111a50ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tk0r4Kht0vr4k0WlIHktnUJ3z5NUxBJl4dHo0yVkpYe4VFQf2eLSNo1O3J4P?=
 =?us-ascii?Q?atx4A8j5blr8lrtikiSOPrwcRWUQXuHdk3yrr/oyxhKcRHlYMJyZb0GsnKNc?=
 =?us-ascii?Q?c98tU5B9h3dTluVdGJSWpFLNw99PubVFm6rY4PrHSnutCrRf4LdQ6JyRrtJc?=
 =?us-ascii?Q?Onp7Nr9sDAS9dmBgwY8xLzqccItpJysSql2HdlLwV1DfZfzgoy/yNyNtQ7Uh?=
 =?us-ascii?Q?A09fxGnb6Hqxre56zdKZ+ysuIJILV/sZScb6e24qlZcc8E42WNq7cKrVkFEl?=
 =?us-ascii?Q?OCxrnRK/5rZXjubWgQf7LAFumgKs0F3r33h9ZLoHLHNGKOULOuF57bE7hBhy?=
 =?us-ascii?Q?w+uqXikQmQHG824ReAKeElgVvvpIHWrKk4SZdhS4kIdPBEFlZkGTkdNfwWfl?=
 =?us-ascii?Q?VvXzeYSM8ROQg4JOXxhjfy3tavHeyybgnKagF0LDK4b8GZSvMP29IhyoCNMV?=
 =?us-ascii?Q?2EKWKnOpFNWV37OSoKiJknW5NN6ThbpjxaoE+Jrz/L98nWJ5zp0hIN+gRVwI?=
 =?us-ascii?Q?XbnQeVuV/KaABlIryL/aSt2N30aLGej5NKN/hASiKtSeB07mtK1FpusZxEWQ?=
 =?us-ascii?Q?2a7Mxh4J9EFZOYn+5smzO6BSPVmnJ8YtK1p22UuMHpd+IsVP6drOUFUPo8Lq?=
 =?us-ascii?Q?3HOGWk7yw+9r8569awzJVMwDm0AUwZ/J3l2grtbk5bOW/pWvyTReE1f7WRMf?=
 =?us-ascii?Q?qgfLVFr4n2LntPOfFaIMeNvIZO9CjzMT2bpL4/Ejv1KXpWvkVPNOiMZ6YHAp?=
 =?us-ascii?Q?FCrUZ4/I0uO4gDOAlfGPLE5j3WugRV/ey7Xi9wbbmnBXMhYNUO5qOac4wq1v?=
 =?us-ascii?Q?83EuDNdhV6rY8Iu3VHssY+lGdH3zm17s5kZxtrzfhUU8LTaV8+yAHqCkp2Xk?=
 =?us-ascii?Q?g1/t++ivtuE9TMVtfPxpyHz60HCGY6K4HxKrRNbbDoEFhHT9kUZ9H27dt5hX?=
 =?us-ascii?Q?1sP/JUrJD74kY4sugHLE+7aWNE8RKgDVrkZ7SC1RI4QTtZRZAWGF9JZLwjL1?=
 =?us-ascii?Q?n42eoj8+3VKaVDSRe77OAbNQJbJ8okbqQMyxLEog2o5Ugr5xk8Y0E7cdTtqy?=
 =?us-ascii?Q?A9ybhb3J/O3alUIdWCpF2iYbCJRuCEmOere/8NWzBAZflzs/OWA4vl9TJCXl?=
 =?us-ascii?Q?/V0h4ilMYS4XOQ4C6JlR6r5z3wNVtT8a0cNtQapqhwOCSNZXCJymcP2NYQgD?=
 =?us-ascii?Q?NMGjaq2Ce9f6JjHAbkDSrt5Zt4ZVY7pm1hHnxd99SvBzhdtBOCB3cK7FBYbZ?=
 =?us-ascii?Q?xDfPhJZO4VOj15wc+g/wYYAdv4twnNxDVWx8WmVGV6gUIXMdGWBI1qV3qMZX?=
 =?us-ascii?Q?WgOJ1lc6R4yyAK6FDiJ83BNWd+GXfvg1Ilv+sug4uWf5nnOCyF1OUdl7QqTJ?=
 =?us-ascii?Q?SjbFaOUKyEq7ZCQbWMOm+QA0G3SaMEaa2UarxEvr91m5YzNK1T1+9rbQaS1E?=
 =?us-ascii?Q?jOMGP+fiv4XkBmXsE3xr49QBYt0OCGHg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ytgsv/DSKVR1GtZ8Zj6fqByjdfg/Sgjwr4DDAUFk81U3ChzocII6Lsf7cXXg?=
 =?us-ascii?Q?9VujmQACsiLRqXbTAjkdnrSSBpaTzu+HjclfUv2zfYm8qRc4TkbwCW74GQKg?=
 =?us-ascii?Q?rJmu32LrxDIM0Be6BfxjB+fIeaboeKdA+h4NWTBH+h5Pi0fpb2MeEkfcTpEO?=
 =?us-ascii?Q?QdTsgRxPVexwT3czbufhNArSriaIyv5DNM77Bv1KLQzZXOP4JK5Zpjgm9x2i?=
 =?us-ascii?Q?iz/JXZDUogusN3g+CkxTEV2tN59CXhXQBuJ6ufneN5aB7aBmAYVp03q1evKk?=
 =?us-ascii?Q?xIeZs8RLsDNABTV4Ay6Q/JU9t/FKRhQkJVRzVgdzJ6fPOvvACOkhb8PLlqFx?=
 =?us-ascii?Q?lXOXXJkRrVa1nDtmQA0F+Ihj5nTXvW8u9EEZSpTXefmuanhVAASVZS/hlhYD?=
 =?us-ascii?Q?ECRaEKIEl/nIDbctMiBxC4rNSNR2mtrUwc79otoFdR6NsFKIAJi6soHiasdm?=
 =?us-ascii?Q?2M2NJ1Hwt7rhMsOsfJRhw/+DwwDjFE6tq+pMkjr687tnvKBJSFwdDQBz/2JP?=
 =?us-ascii?Q?6OoGIo3htQG2JmpF8EpUc8a9txKO8j2yMBkZshtd8jxYw5KJ6a8GLVbz7czl?=
 =?us-ascii?Q?A3TJkvX6nLMj+dVEJyBLFmZIeAwebSnobIT7z8WXRUaZHUtLUFnSaXBEeG8s?=
 =?us-ascii?Q?nPPgK1ewQmQ6msUc7h0sAWEvEOt7NaV7eNby0J4SEc1eXXSOxynkECrjucnr?=
 =?us-ascii?Q?XP1skY7aSlDsKkGED9x1lMD8nEeoRWD41r9uILqQEd1JTrrbRMe/0nlwZJmx?=
 =?us-ascii?Q?rWyaDXkczlQiq1INLi5ekBBBn0BYVAJgbkBs7oQ4H+722FapcqrpGDnDuKk8?=
 =?us-ascii?Q?JOBshywu4yPEbJBy7Bspvun2gwrf7a0TpLqHDFfjiT/fIqQxoTbYbvRp0SFZ?=
 =?us-ascii?Q?eWuRpQe8KY6Ge9FMRUOLFjK8ViLHP1pLstypC45VJ6qSqi46HqJEDJh0fyxU?=
 =?us-ascii?Q?kFb5+9L/j1q54kpGPAufmnRSWTHtMCK/0DGk3Z/i57RcXuQ8FjfHBMa1q2N1?=
 =?us-ascii?Q?Jo5hhSN32ATrUffih+nqN5IDUZwXmJEe23r+tdVBZHbY2uorhzFk9+SeJqTM?=
 =?us-ascii?Q?g2/1wo7ZeKaUW9uEFvhjnEfzxpcT2AXEHwlslxKwlLfsmwbdwhkvM9NhsccG?=
 =?us-ascii?Q?wuqpOVpWW1XIBr70ixcZCr9uoYEAJzAk7vU/nEjV2Wxa/09qZgs5b6F/yfI5?=
 =?us-ascii?Q?vBgeHTAorY0aOspFthsZyM6s5MUSjgg3mqev1lbYbAsNGigD9DO0LGmJITw4?=
 =?us-ascii?Q?YrFn7Pz0MIlDoukdrSd3wnjYB2PgFs7SW1m//v8ua25aEQB6+Hl+MvLA7F50?=
 =?us-ascii?Q?mY7suIP1tRAItaEQL3VMHnd3wReD/WF5ic3NOFB0BIKflVvlD7OmQ9keH90R?=
 =?us-ascii?Q?DdZVyn3n6NyT20KkZIFhvCXmqtiRftBT/MtXjEZh40SDGDwhzWyWrncDhXeM?=
 =?us-ascii?Q?k5uKI6WKfajw1rCLYuFiR4irs/bnMflO6McTktYvmncvjl8M+gTgQDvz5fys?=
 =?us-ascii?Q?n34UcXqFZeox6C3Z1ujeyaw5xYKwU4hy0vxn9KrAFzvh6GvB1lPX1kyKGxyZ?=
 =?us-ascii?Q?TDcRuDDw5lyJjgiAIK9fmMeOG/Tjzz8eOvn6q98Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3HoEEVl0YCVoSuIObSYqwmQ6bZrsdL9CzAIdE/kfzRX+RDBdQFGkrFR4CHfRrmy5z/RXqGvvvcZMzipV8u6ks2schWWGFZB94eEhMYCWk14M8YyaO/BwiODX1IiPlh/C71Aun2hz+a9m71tnngeLzT5/9BtSRuqZSiWaZNfS7EdI69mKVF/awLsgWwq4q7v8ddqH8/y8SqtAFk5Nm1dCJuaCkB9LSzHO0TeJtPZ8mwlEdU3HuRODtOnIKhVjhyh+lQpLthdsVvFD871gMAgi/5lkSKKJ0bC2pAtY1gFXq/+Oq6G8w1g5vbsYjh+n7vtSulymCdJqAfmzqXI/Hr3RFY3QZcxWc3eCObeCW6G5TxTENunpgTcirtjT6UG6ubN0/beLA0ifDBpZZbj9hBhzJz4uslH9gqMyKDWoDrOzxOO59ua6XclP91rPOHIVODa2slDdvr61DAaRaIWTPTagyW4pjycW064I4Q3I4vi+4XdsuTgGKxC3ku366xnDShrl7a/DEWAVlNHeXrxuek1G0Af9m0MrBBYifn87RVgle5DDBUMi/eXdyVN+ZhAlBSkCjwu6ADVU6XJS9Csxtv0EKsTIpLpIsIoRPGmNnvZLQZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f7ea1b-24bc-4525-da0b-08de111a50ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:06.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lwWq0oHsrMbR2Rw6N3IB7uM7nI+QtCSdrvQjJOdVPFA9YsEs8UOpjZxAapDzw6fVkIACnZrpRcJ5PDeb2bmhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-ORIG-GUID: BYaFJVHosmyQU9JUbFSYilDFNeL0O2Km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXxqEYLLNz6nqi
 Vok+rmAg/c1j8pss4c6BHsgxv+VShGf3Yc4SEuu4IOJk2LrLVdf3yPnFAkOFWzkE8xJ3bCQfN2D
 GeMyt42+MAdzQedGMEn36JxbAVxLcwMp4h8qvgZeAjVgMjFyomyZpgc9YJFg0RMWSpodZvj+300
 r/Oxdr87A8KTQx5XMATXqo6mD5jVyKJbx8cKVcn//cn/bQvhNA+kDfnXuuTcKUmxv745cRxL28L
 ZfUxDqxXsMTeYvV46Gg+Tl9riU37n9r/pkUCDZ26g1T6jQ08oeEAu7yA60trfZMd0MfEd9QzKWs
 GIZ7EKJK5N1vIANflVKrw60hWI7jwj/NXi4btkM3vpnw7O9KcXewu9bQu0DH2PDKHmUX/6S2wTo
 T2wUGYc+un5HOeJ+KP/87XtOABWG/w==
X-Proofpoint-GUID: BYaFJVHosmyQU9JUbFSYilDFNeL0O2Km
X-Authority-Analysis: v=2.4 cv=csaWUl4i c=1 sm=1 tr=0 ts=68f84f59 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=jorBoWOkfoBizQaWMR4A:9 a=EM9i9RKVquG_UPIc:21

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/aggregation.md        |  8 ++---
 doc/userguide/reference/compiler_options.md   |  2 +-
 ...gram_syntax_reference_program_structure.md |  2 +-
 .../dtrace-ref-DTraceSupportforStrings.md     | 12 +++----
 .../dtrace-ref-PointersandScalarArrays.md     | 14 ++++----
 .../reference/dtrace-ref-StructsandUnions.md  | 12 +++----
 ...dtrace-ref-TypesOperatorsandExpressions.md | 36 +++++++++----------
 .../reference/dtrace-ref-Variables.md         |  4 +--
 .../reference/dtrace-ref-speculation.md       |  2 +-
 .../reference/dtrace_command_desc.md          |  2 +-
 .../reference/dtrace_command_exit_status.md   |  2 +-
 .../reference/dtrace_command_operands.md      |  2 +-
 .../reference/dtrace_command_options.md       |  2 +-
 .../reference/dtrace_runtime_options.md       |  2 +-
 .../reference/dynamic_runtime_options.md      |  2 +-
 ...ing_dtrace_compiler_and_runtime_options.md |  2 +-
 16 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
index 8bdd44b49..5fada5410 100644
--- a/doc/userguide/reference/aggregation.md
+++ b/doc/userguide/reference/aggregation.md
@@ -1,5 +1,5 @@
 
-# Aggregations {#dt_ref_aggregations}
+# Aggregations <a id="dt_ref_aggregations">
 
 Aggregations enable you to accumulate data for statistical analysis. The aggregation is calculated at runtime, so that post-processing isn't required and processing is highly efficient and accurate. Aggregations function similarly to associative arrays, but are populated by aggregating functions. In D, the syntax for an aggregation is as follows:
 
@@ -13,7 +13,7 @@ Aggregations can be regular or indexed. Indexed aggregations use keys, where *ke
 
 The *aggfunc* is one of the DTrace aggregating functions, and *args* is a comma-separated list of arguments appropriate to that function. Most aggregating functions take a single argument that represents the new datum.
 
-## Aggregation Functions {#dt_ref_aggr_funcs}
+## Aggregation Functions <a id="dt_ref_aggr_funcs">
 
 The following functions are aggregating functions that can be used in a program to collect data and present it in a meaningful way.
 
@@ -36,7 +36,7 @@ The following functions are aggregating functions that can be used in a program
 -   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
 
 
-## Printing Aggregations {#dt_ref_aggr_print}
+## Printing Aggregations <a id="dt_ref_aggr_print">
 
 By default, several aggregations are displayed in the order in which they're introduced in the D program. You can override this behavior by using the `[printa](function_printa.md)` function to print the aggregations. The `printa` function also lets you precisely format the aggregation data by using a format string.
 
@@ -44,7 +44,7 @@ If an aggregation isn't formatted with a `printa` statement in a D program, the
 
 The default output format for the `avg`, `count`, `min`, `max`, `stddev`, and `sum` aggregating functions displays an integer decimal value corresponding to the aggregated value for each tuple. The default output format for the `quantize`, `lquantize`, and `llquantize` aggregating functions displays an ASCII histogram with the results. Aggregation tuples are printed as though `trace` had been applied to each tuple element.
 
-## Data Normalization {#dt_ref_aggr_dnorm}
+## Data Normalization <a id="dt_ref_aggr_dnorm">
 
 When aggregating data over some period, you might want to normalize the data based on some constant factor. This technique lets you compare disjointed data more easily. For example, when aggregating system calls, you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run. The DTrace `[normalize](function_normalize.md)` function lets you normalize data in this way. The parameters to `normalize` are an aggregation and a normalization factor. The output of the aggregation shows each value divided by the normalization factor.
 
diff --git a/doc/userguide/reference/compiler_options.md b/doc/userguide/reference/compiler_options.md
index 8e2813c1f..3cc4c72ff 100644
--- a/doc/userguide/reference/compiler_options.md
+++ b/doc/userguide/reference/compiler_options.md
@@ -1,5 +1,5 @@
 
-# Compile-time Options {#dt_compiler_options}
+# Compile-time Options <a id="dt_compiler_options">
 
 Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
 
diff --git a/doc/userguide/reference/d_program_syntax_reference_program_structure.md b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
index 547fd7a36..dc6a31a3b 100644
--- a/doc/userguide/reference/d_program_syntax_reference_program_structure.md
+++ b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
@@ -1,5 +1,5 @@
 
-# Program Structure {#dt_prog_struct}
+# Program Structure <a id="dt_prog_struct">
 
 A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
 
diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index 98f482c63..ea44523ed 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -1,11 +1,11 @@
 
-# DTrace String Processing {#dt_strings_dlang}
+# DTrace String Processing <a id="dt_strings_dlang">
 
 DTrace provides facilities for tracing and manipulating strings. This section describes the complete set of D language features for declaring and manipulating strings. Unlike ANSI C, strings in D have their own built-in type and operator support to enable you to easily and unambiguously use them in tracing programs.
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## String Representation {#dt_strrep_dlang}
+## String Representation <a id="dt_strrep_dlang">
 
 In DTrace, strings are represented as an array of characters ending in a null byte, which is a byte with a value of zero, usually written as `'\0'`. The visible part of the string is of variable length, depending on the location of the null byte, but DTrace stores each string in a fixed-size array so that each probe traces a consistent amount of data. Strings cannot exceed the length of the predefined string limit. However, the limit can be modified in your D program or on the `dtrace` command line by tuning the `strsize` option. The default string limit is 256 bytes.
 
@@ -33,13 +33,13 @@ trace(s);
 
 You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md).
 
-## String Constants {#dt_strcon_dlang}
+## String Constants <a id="dt_strcon_dlang">
 
 String constants are enclosed in pairs of double quotes \(`""`\) and are automatically assigned the type `string` by the D compiler. You can define string constants of any length, limited only by the amount of memory DTrace is permitted to consume on the system and by whatever limit you have set for the `strsize` DTrace runtime option. The terminating null byte \(`\0`\) is added automatically by the D compiler to any string constants that you declare. The size of a string constant object is the number of bytes associated with the string, plus one additional byte for the terminating null byte.
 
 A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can also contain any of the special character escape sequences that are defined for character constants.
 
-## String Assignment {#dt_strasg_dlang}
+## String Assignment <a id="dt_strasg_dlang">
 
 Unlike the assignment of `char *` variables, strings are copied by value and not by reference. The string assignment operator `=` copies the actual bytes of the string from the source operand up to and including the null byte to the variable on the left-hand side, which must be of type `string`.
 
@@ -63,7 +63,7 @@ String assignment is analogous to the C library function `strcpy()`, with the ex
 
 You can also assign to a string variable an expression of a type that's compatible with strings. In this case, the D compiler automatically promotes the source expression to the string type and performs a string assignment. The D compiler permits any expression of type `char *` or of type `char[n]`, a scalar array of `char` of any size, to be promoted to a string.
 
-## String Conversion {#dt_strconv_dlang}
+## String Conversion <a id="dt_strconv_dlang">
 
 Expressions of other types can be explicitly converted to type `string` by using a cast expression or by applying the special `stringof` operator, which are equivalent in the following meaning:
 
@@ -78,7 +78,7 @@ The `stringof` operator binds very tightly to the operand on its right-hand side
 
 Scalar type expressions, such as a pointer or integer, or a scalar array address can be converted to strings, in that the scalar is interpreted as an address to a char type. Expressions of other types such as `void` may not be converted to `string`. If you erroneously convert an invalid address to a string, the DTrace safety features prevents you from damaging the system or DTrace, but you might end up tracing a sequence of undecipherable characters.
 
-## String Comparison {#dt_strcomp_dlang}
+## String Comparison <a id="dt_strcomp_dlang">
 
 D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
 
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index da4b69333..8746ae2fd 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -1,5 +1,5 @@
 
-# Pointers {#dt_ptrarr_dlang}
+# Pointers <a id="dt_ptrarr_dlang">
 
 Pointers are memory addresses of data objects and reference memory used by the OS, by the user program, or by the D script. Pointers in D are data objects that store an integer virtual address value and associate it with a D type that describes the format of the data stored at the corresponding memory location.
 
@@ -29,7 +29,7 @@ In this example, the first fragment creates a D global variable pointer `q`. Bec
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Pointer Safety {#dt_ptrsafety_dlang}
+## Pointer Safety <a id="dt_ptrsafety_dlang">
 
 DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called `[exit](function_exit.md)` for the ERROR probe.
 
@@ -55,7 +55,7 @@ dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0
 
 Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
 
-## Pointer and Array Relationship {#dt_ptrarel_dlang}
+## Pointer and Array Relationship <a id="dt_ptrarel_dlang">
 
 A scalar array is represented by a variable that's associated with the address of its first storage location. A pointer is also the address of a storage location with a defined type. Thus, D permits the use of the array `[]` index notation with both pointer variables and array variables. For example, the following two D fragments are equivalent in meaning:
 
@@ -71,7 +71,7 @@ The difference between pointers and arrays is that a pointer variable refers to
 
 This difference is manifested in the D syntax if you try to assign pointers and scalar arrays. If `x` and `y` are pointer variables, the expression `x = y` is legal; it copies the pointer address in `y` to the storage location that's named by `x`. If `x` and `y` are scalar array variables, the expression `x = y` isn't legal. Arrays can't be assigned as a whole in D. If `p` is a pointer and `a` is a scalar array, the statement `p = a` is permitted. This statement is equivalent to the statement `p = &a[0]`.
 
-## Pointer Arithmetic {#dt_ptrarith_dlang}
+## Pointer Arithmetic <a id="dt_ptrarith_dlang">
 
 As in C, pointer arithmetic in D isn't identical to integer arithmetic. Pointer arithmetic implicitly adjusts the underlying address by multiplying or dividing the operands by the size of the type referenced by the pointer.
 
@@ -106,17 +106,17 @@ BEGIN
 }
 ```
 
-## Generic Pointers {#dt_genptr_dlang}
+## Generic Pointers <a id="dt_genptr_dlang">
 
 Sometimes it's useful to represent or manipulate a generic pointer address in a D program without specifying the type of data referred to by the pointer. Generic pointers can be specified by using the type `void *`, where the keyword `void` represents the absence of specific type information, or by using the built-in type alias `uintptr_t`, which is aliased to an unsigned integer type of size that's appropriate for a pointer in the current data model. You can't apply pointer arithmetic to an object of type `void *`, and these pointers can't be dereferenced without casting them to another type first. You can cast a pointer to the `uintptr_t` type when you need to perform integer arithmetic on the pointer value.
 
 Pointers to `void` can be used in any context where a pointer to another data type is required, such as an associative array tuple expression or the right-hand side of an assignment statement. Similarly, a pointer to any data type can be used in a context where a pointer to `void` is required. To use a pointer to a non-`void` type in place of another non-`void` pointer type, an explicit cast is required. You must always use explicit casts to convert pointers to integer types, such as `uintptr_t`, or to convert these integers back to the appropriate pointer type.
 
-## Pointers to DTrace Objects {#dt_ptrobj_dlang}
+## Pointers to DTrace Objects <a id="dt_ptrobj_dlang">
 
 The D compiler prohibits you from using the `&` operator to obtain pointers to DTrace objects such as associative arrays, built-in functions, and variables. You're prohibited from obtaining the address of these variables so that the DTrace runtime environment is free to relocate them as needed between probe firings . In this way, DTrace can more efficiently manage the memory required for programs. If you create composite structures, it's possible to construct expressions that retrieve the kernel address of DTrace object storage. Avoid creating such expressions in D programs. If you need to use such an expression, don't rely on the address being the same across probe firings.
 
-## Pointers and Address Spaces {#dt_ptraddrsp_dlang}
+## Pointers and Address Spaces <a id="dt_ptraddrsp_dlang">
 
 A pointer is an address that provides a translation within some *virtual address space* to a piece of physical memory. DTrace runs D programs within the address space of the OS kernel itself. The Linux system manages many address spaces: one for the OS kernel itself, and one for each user process. Because each address space provides the illusion that it can access all the memory on the system, the same virtual address pointer value can be reused across address spaces, but translate to different physical memory. Therefore, when writing D programs that use pointers, you must be aware of the address space corresponding to the pointers you intend to use.
 
diff --git a/doc/userguide/reference/dtrace-ref-StructsandUnions.md b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
index aa4f092df..ba55bcf55 100644
--- a/doc/userguide/reference/dtrace-ref-StructsandUnions.md
+++ b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
@@ -1,11 +1,11 @@
 
-# Structs and Unions {#dt_structunion_dlang}
+# Structs and Unions <a id="dt_structunion_dlang">
 
 Collections of related variables can be grouped together into composite data objects called *structs* and *unions*. You define these objects in D by creating new type definitions for them. You can use any new types for any D variables, including associative array values. This section explores the syntax and semantics for creating and manipulating these composite types and the D operators that interact with them.
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Structs {#dt_structs_dlang}
+## Structs <a id="dt_structs_dlang">
 
 The D keyword `struct`, short for *structure*, is used to introduce a new type that's composed of a group of other types. The new `struct` type can be used as the type for D variables and arrays, enabling you to define groups of related variables under a single name. D structs are the same as the corresponding construct in C and C++. If you have programmed in the Java programming language, think of a D struct as a class that contains only data members and no methods.
 
@@ -122,7 +122,7 @@ The `date` program runs and is traced until it exits and fires the `END` probe w
  write    1         29          9817
 ```
 
-## Pointers to Structs {#dt_ptrstructs_dlang}
+## Pointers to Structs <a id="dt_ptrstructs_dlang">
 
 Referring to structs by using pointers is common in C and D. You can use the operator `->` to access struct members through a pointer. If `struct s` has a member `m`, and you have a pointer to this struct named `sp`, where `sp` is a variable of type `struct s *`, you can either use the `*` operator to first dereference the `sp` pointer to access the member:
 
@@ -217,11 +217,11 @@ date -R  run by UID 500
 
 Complex data structures are used often in C programs, so the ability to describe and reference structs from D also provides a powerful capability for observing the inner workings of the Linux kernel and its system interfaces.
 
-## Unions {#dt_unions_dlang}
+## Unions <a id="dt_unions_dlang">
 
 Unions are another kind of composite type available in ANSI C and D and are related to structs. A union is a composite type where a set of members of different types are defined and the member objects all occupy the same region of storage. A union is therefore an object of variant type, where only one member is valid at any particular time, depending on how the union has been assigned. Typically, some other variable, or piece of state is used to indicate which union member is currently valid. The size of a union is the size of its largest member. The memory alignment that's used for the union is the maximum alignment required by the union members.
 
-## Member Sizes and Offsets {#dt_memsz_dlang}
+## Member Sizes and Offsets <a id="dt_memsz_dlang">
 
 You can determine the size in bytes of any D type or expression, including a `struct` or `union`, by using the `sizeof` operator. The `sizeof` operator can be applied either to an expression or to the name of a type surrounded by parentheses, as illustrated in the following two examples:
 
@@ -240,7 +240,7 @@ offsetof (*type-name*, *member-name*)
 
 Here, *type-name* is the name of any `struct` or `union` type or type alias, and *member-name* is the identifier naming a member of that struct or union. Similar to `sizeof`, `offsetof` returns a `size_t` and you can use it anywhere in a D program that an integer constant can be used.
 
-## Bit-Fields {#dt_bitflds_dlang}
+## Bit-Fields <a id="dt_bitflds_dlang">
 
 D also permits the definition of integer struct and union members of arbitrary numbers of bits, known as *bit-fields*. A bit-field is declared by specifying a signed or unsigned integer base type, a member name, and a suffix indicating the number of bits to be assigned for the field, as shown in the following example:
 
diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 1a1549445..c76d293c7 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -1,11 +1,11 @@
 
-# Types, Operators, and Expressions {#dt_types_dlang}
+# Types, Operators, and Expressions <a id="dt_types_dlang">
 
 D provides the ability to access and manipulate various data objects: variables and data structures can be created and changed, data objects that are defined in the OS kernel and user processes can be accessed, and integer, floating-point, and string constants can be declared. D provides a superset of the ANSI C operators that are used to manipulate objects and create complex expressions. This section describes the detailed set of rules for types, operators, and expressions.
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Identifier Names and Keywords {#dt_ident_dlang}
+## Identifier Names and Keywords <a id="dt_ident_dlang">
 
 D identifier names are composed of uppercase and lowercase letters, digits, and underscores, where the first character must be a letter or underscore. All identifier names beginning with an underscore \(`_`\) are reserved for use by the D system libraries. Avoid using these names in D programs. By convention, D programmers typically use mixed-case names for variables and all uppercase names for constants.
 
@@ -203,7 +203,7 @@ D language keywords are special identifiers that are reserved for use in the pro
 </td></tr><tbody></table>
 D reserves for use as keywords a superset of the ANSI C keywords. The keywords reserved for future use by the D language are marked with `*`. The D compiler produces a syntax error if you try to use a keyword that's reserved for future use. The keywords that are defined by D but not defined by ANSI C are marked with `+`. D provides the complete set of types and operators found in ANSI C. The major difference in D programming is the absence of control-flow constructs. Note that keywords associated with control-flow in ANSI C are reserved for future use in D.
 
-## Data Types and Sizes {#dt_dtypes_dlang}
+## Data Types and Sizes <a id="dt_dtypes_dlang">
 
 D provides fundamental data types for integers and floating-point constants. Arithmetic can only be performed on integers in D programs. Floating-point constants can be used to initialize data structures, but floating-point arithmetic isn't permitted in D. D provides a 64-bit data model for use in writing programs.
 
@@ -392,7 +392,7 @@ Type Name
 </td></tr><tbody></table>
 D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md).
 
-## Constants {#dt_consts_dlang}
+## Constants <a id="dt_consts_dlang">
 
 Integer constants can be written in decimal \(`12345`\), octal \(`012345`\), or hexadecimal `(0x12345`\) format. Octal \(base 8\) constants must be prefixed with a leading zero. Hexadecimal \(base 16\) constants must be prefixed with either `0x` or `0X`. Integer constants are assigned the smallest type among `int`, `long`, and `long long` that can represent their value. If the value is negative, the signed version of the type is used. If the value is positive and too large to fit in the signed type representation, the unsigned type representation is used. You can apply one of the suffixes listed in the following table to any integer constant to explicitly specify its D type.
 
@@ -607,7 +607,7 @@ You can include more than one character specifier inside single quotes to create
 
 Strings constants of any length can be composed by enclosing them in a pair of double quotes \(`"hello"`\). A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can contain any of the special character escape sequences that are shown for character constants before. Similar to ANSI C, strings are represented as arrays of characters that end with a null character \(`\0`\) that's implicitly added to each string constant you declare. String constants are assigned the special D type `string`. The D compiler provides a set of special features for comparing and tracing character arrays that are declared as strings.
 
-## Arithmetic Operators {#dt_arithops_dlang}
+## Arithmetic Operators <a id="dt_arithops_dlang">
 
 Binary arithmetic operators are described in the following table. These operators all have the same meaning for integers that they do in ANSI C.
 
@@ -666,7 +666,7 @@ However, the DTrace execution environment does automatically check for and repor
 
 In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
 
-## Relational Operators {#dt_relatops_dlang}
+## Relational Operators <a id="dt_relatops_dlang">
 
 Binary relational operators are described in the following table. These operators all have the same meaning that they do in ANSI C.
 
@@ -766,7 +766,7 @@ Returns 0 \(`false`\)
 </td></tr><tbody></table>
 Relational operators can also be used to compare a data object associated with an enumeration type with any of the enumerator tags defined by the enumeration.
 
-## Logical Operators {#dt_logicops_dlang}
+## Logical Operators <a id="dt_logicops_dlang">
 
 Binary logical operators are listed in the following table. The first two operators are equivalent to the corresponding ANSI C operators.
 
@@ -809,7 +809,7 @@ In addition to the binary logical operators, the unary `!` operator can be used
 
 The logical operators can be applied to operands of integer or pointer types. The logical operators interpret pointer operands as unsigned integer values. As with all logical and relational operators in D, operands are true if they have a non-zero integer value and false if they have a zero integer value.
 
-## Bitwise Operators {#dt_bitwiseops_dlang}
+## Bitwise Operators <a id="dt_bitwiseops_dlang">
 
 D provides the bitwise operators that are listed in the following table for manipulating individual bits inside integer operands. These operators all have the same meaning as in ANSI C.
 
@@ -874,7 +874,7 @@ The shift operators are used to move bits left or right in a particular integer
 
 Shifting an integer value by a negative number of bits or by a number of bits larger than the number of bits in the left-hand operand itself produces an undefined result. The D compiler produces an error message if the compiler can detect this condition when you compile the D program.
 
-## Assignment Operators {#dt_assignops_dlang}
+## Assignment Operators <a id="dt_assignops_dlang">
 
 Binary assignment operators are listed in the following table. You can only modify D variables and arrays. Kernel data objects and constants can not be modified using the D assignment operators. The assignment operators have the same meaning as they do in ANSI C.
 
@@ -979,7 +979,7 @@ Aside from the assignment operator `=`, the other assignment operators are provi
 
 The result of any assignment operator is an expression equal to the new value of the left-hand expression. You can use the assignment operators or any of the operators described thus far in combination to form expressions of arbitrary complexity. You can use parentheses `()` to group terms in complex expressions.
 
-## Increment and Decrement Operators {#dt_incdecops_dlang}
+## Increment and Decrement Operators <a id="dt_incdecops_dlang">
 
 D provides the special unary `++` and `--` operators for incrementing and decrementing pointers and integers. These operators have the same meaning as they do in ANSI C. These operators can be applied to variables and to the individual elements of a struct, union, or array. The operators can be applied either before or after the variable name. If the operator appears before the variable name, the variable is first changed and then the resulting expression is equal to the new value of the variable. For example, the following two code fragments produce identical results:
 
@@ -1012,7 +1012,7 @@ foo[1]++;
 
 The increment and decrement operators can be applied to integer or pointer variables. When applied to integer variables, the operators increment, or decrement the corresponding value by one. When applied to pointer variables, the operators increment, or decrement the pointer address by the size of the data type that's referenced by the pointer.
 
-## Conditional Expressions {#dt_condexp_dlang}
+## Conditional Expressions <a id="dt_condexp_dlang">
 
 D doesn't provide the facility to use `if-then-else` constructs. Instead, conditional expressions, by using the ternary operator \(`?:`\), can be used to approximate some of this functionality. The ternary operator associates a triplet of expressions, where the first expression is used to conditionally evaluate one of the other two.
 
@@ -1032,7 +1032,7 @@ hexval = (c >= '0' && c <= '9') ? c - '0' : (c >= 'a' && c <= 'f') ? c + 10 - 'a
 
 To be evaluated for its truth value, the first expression that's used with `?:` must be a pointer or integer. The second and third expressions can be of any compatible types. You can't construct a conditional expression where, for example, one path returns a string and another path returns an integer. The second and third expressions must be true expressions that have a value. Therefore, data reporting functions can't be used in these expressions because those functions don't return a value. To conditionally trace data, use a predicate instead.
 
-## Type Conversions {#dt_typeconv_dlang}
+## Type Conversions <a id="dt_typeconv_dlang">
 
 When expressions are constructed by using operands of different but compatible types, type conversions are performed to determine the type of the resulting expression. The D rules for type conversions are the same as the arithmetic conversion rules for integers in ANSI C. These rules are sometimes referred to as the *usual arithmetic conversions*.
 
@@ -1052,7 +1052,7 @@ In this example, the destination type is within parentheses and used to prefix t
 
 Because D doesn't include floating-point arithmetic, no floating-point operand conversion or casting is permitted and no rules for implicit floating-point conversion are defined.
 
-## Operator Precedence {#dt_preced_dlang}
+## Operator Precedence <a id="dt_preced_dlang">
 
 D includes complex rules for operator precedence and associativity. The rules provide precise compatibility with the ANSI C operator precedence rules. The entries in the following table are in order from highest precedence to lowest precedence.
 
@@ -1268,11 +1268,11 @@ Dereferences a pointer to an object.
 Accesses a member of a structure or union type.
 
 </td></tr><tbody></table>
-## Type and Constant Definitions {#dt_typcondef_dlang}
+## Type and Constant Definitions <a id="dt_typcondef_dlang">
 
 This section describes how to declare type aliases and named constants in D. It also discusses D type and namespace management for program and OS types and identifiers.
 
-### typedefs {#dt_typedefs_dlang}
+### typedefs <a id="dt_typedefs_dlang">
 
 The `typedef` keyword is used to declare an identifier as an alias for an existing type. The `typedef` declaration is used outside of probe clauses in the following form:
 
@@ -1297,7 +1297,7 @@ typedef struct foo {
 
 In the previous example, `struct foo` is defined using the same type as its alias, `foo_t`. Linux C system headers often use the suffix `_t` to denote a `typedef` alias.
 
-### Enumerations {#dt_enums_dlang}
+### Enumerations <a id="dt_enums_dlang">
 
 Defining symbolic names for constants in a program eases readability and simplifies the process of maintaining the program in the future. One method is to define an *enumeration*, which associates a set of integers with a set of identifiers called enumerators that the compiler recognizes and replaces with the corresponding integer value. An enumeration is defined by using a declaration such as the following:
 
@@ -1329,7 +1329,7 @@ The D enumeration syntax is the same as the corresponding syntax in ANSI C. D al
 
 
 
-### Inlines {#dt_inlines_dlang}
+### Inlines <a id="dt_inlines_dlang">
 
 D named constants can also be defined by using `inline` directives, which provide a more general means of creating identifiers that are replaced by predefined values or expressions during compilation. Inline directives are a more powerful form of lexical replacement than the `#define` directive provided by the C preprocessor because the replacement is assigned an actual type and is performed by using the compiled syntax tree and not a set of lexical tokens. An `inline` directive is specified by using a declaration of the following form:
 
@@ -1371,7 +1371,7 @@ These inline definitions provide you with access to the current set of Linux sig
 
 By default, the D compiler includes all the provided D library files automatically so that you can use these definitions in any D program.
 
-### Type Namespaces {#dt_typens_dlang}
+### Type Namespaces <a id="dt_typens_dlang">
 
 In traditional languages such as ANSI C, type visibility is determined by whether a type is nested inside a function or other declaration. Types declared at the outer scope of a C program are associated with a single global namespace and are visible throughout the entire program. Types that are defined in C header files are typically included in this outer scope. Unlike these languages, D provides access to types from several outer scopes.
 
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index bc10071ca..d3afa3833 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -1,5 +1,5 @@
 
-# Variables {#dt_vars_dlang}
+# Variables <a id="dt_vars_dlang">
 
 D provides several variable types: scalar variables, associative arrays, scalar arrays, and multidimensional scalar arrays. Variables can be created by declaring them explicitly, but are most often created implicitly on first use. Variables can be restricted to clause or thread scope to avoid name conflicts and to control the lifetime of a variable explicitly.
 
@@ -80,7 +80,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Variable Scope {#dt_vscope_dlang}
+## Variable Scope <a id="dt_vscope_dlang">
 
 Variable scoping is used to define where variable names are valid within a program and to avoid variable naming collisions. By using scoped variables you can control the availability of the variable instance to the whole program, a particular thread, or a specific clause.
 
diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
index 181d45db3..30c5e6eaa 100644
--- a/doc/userguide/reference/dtrace-ref-speculation.md
+++ b/doc/userguide/reference/dtrace-ref-speculation.md
@@ -1,5 +1,5 @@
 
-# Speculation {#dt_ref_speculation}
+# Speculation <a id="dt_ref_speculation">
 
 DTrace includes a speculative tracing facility that can be used to tentatively trace data at one or more probe locations. You can then decide to commit the data to the principal buffer at another probe location. You can use speculation to trace data that only contains the output that's of interest; no extra processing is required and the DTrace overhead is minimized.
 
diff --git a/doc/userguide/reference/dtrace_command_desc.md b/doc/userguide/reference/dtrace_command_desc.md
index eeb45509c..64edfe648 100644
--- a/doc/userguide/reference/dtrace_command_desc.md
+++ b/doc/userguide/reference/dtrace_command_desc.md
@@ -1,5 +1,5 @@
 
-# About the dtrace Command {#dtrace_command_desc}
+# About the dtrace Command <a id="dtrace_command_desc">
 
 The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
 
diff --git a/doc/userguide/reference/dtrace_command_exit_status.md b/doc/userguide/reference/dtrace_command_exit_status.md
index 97aaa7100..d1a321799 100644
--- a/doc/userguide/reference/dtrace_command_exit_status.md
+++ b/doc/userguide/reference/dtrace_command_exit_status.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Exit Status {#dtrace_command_exit_status}
+# dtrace Command Exit Status <a id="dtrace_command_exit_status">
 
 The following exit values are returned by the `dtrace` command:
 
diff --git a/doc/userguide/reference/dtrace_command_operands.md b/doc/userguide/reference/dtrace_command_operands.md
index d5261b225..03db4b976 100644
--- a/doc/userguide/reference/dtrace_command_operands.md
+++ b/doc/userguide/reference/dtrace_command_operands.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Operands {#dtrace_command_operands}
+# dtrace Command Operands <a id="dtrace_command_operands">
 
 You can specify zero or more extra arguments on the `dtrace` command line to define a set of macro variables, such as `$1`, `$2`, and so on, to be used in any D programs that are specified with the `-s` option or on the command line.
 
diff --git a/doc/userguide/reference/dtrace_command_options.md b/doc/userguide/reference/dtrace_command_options.md
index 86c41abf1..8b8bcea19 100644
--- a/doc/userguide/reference/dtrace_command_options.md
+++ b/doc/userguide/reference/dtrace_command_options.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Options {#dtrace_command_options}
+# dtrace Command Options <a id="dtrace_command_options">
 
 The `dtrace` command accepts the following options:
 
diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
index 766709af2..f59223916 100644
--- a/doc/userguide/reference/dtrace_runtime_options.md
+++ b/doc/userguide/reference/dtrace_runtime_options.md
@@ -1,5 +1,5 @@
 
-# DTrace Runtime and Compile-time Options Reference {#dt_runtime_options}
+# DTrace Runtime and Compile-time Options Reference <a id="dt_runtime_options">
 
 DTrace uses reasonable default values and flexible default policies for runtime configuration. Tuning mechanisms in the form of DTrace compiler or runtime option can change the default behavior of the `dtrace` utility. You can find more information about the `dtrace` utility and various command line options in the `dtrace(8)` manual page.
 
diff --git a/doc/userguide/reference/dynamic_runtime_options.md b/doc/userguide/reference/dynamic_runtime_options.md
index a42ed3e7b..5c56a05e3 100644
--- a/doc/userguide/reference/dynamic_runtime_options.md
+++ b/doc/userguide/reference/dynamic_runtime_options.md
@@ -1,5 +1,5 @@
 
-# Dynamic Runtime Options {#dt_dynamic_runtime_options}
+# Dynamic Runtime Options <a id="dt_dynamic_runtime_options">
 
 Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
 
diff --git a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
index f978c7825..0f0224bf3 100644
--- a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
+++ b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
@@ -1,5 +1,5 @@
 
-# Setting DTrace Compile-time and Runtime Options {#dt_runtime_option_description}
+# Setting DTrace Compile-time and Runtime Options <a id="dt_runtime_option_description">
 
 You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
 
-- 
2.47.3

