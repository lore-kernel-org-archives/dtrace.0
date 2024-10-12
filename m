Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B26E126C1D
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728706425; cv=fail; b=fNZHHg8lYUWGa2tLV+ryeqH+pa8rFb2I91TAmJru/4WbPmkyYUr8XZGqrGxPjgNxV9BfvQO08uNiGy166gdXXKp16n7PkJSNYfscTpoXL9FxEL8dwnvGh3ClWlsfbh+oazpNoaeOBEoNdSHSppQo/sTO5gWPRSV8fUDCcgnfsLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728706425; c=relaxed/simple;
	bh=fiesA8AHsiZ4YlF82qmtz39rOxtcARJG8ViSdhnzbYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AK2CpNvsbEsGIQ9bDl9a5Nfv/uYgy0KHlMN4X7oPZW9hYqV/4RDbl03mqBIWUzG9H1g2/G838kpNAmAVyRgK7n27oZDqngZhCrnINHKGwc/x+IKyw0h9aubyWuvRtf646QKkVgL4Fu+5eLLAIFgQOjFDNFnocPipG7PaoO/nO5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hyg5EEDU; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eNWsADSj reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hyg5EEDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eNWsADSj"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3MiUt024931;
	Sat, 12 Oct 2024 04:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=74/u0g7Xi4p43hZHoZrRNXJhF0xRyYRvvGOAHCdQc9s=; b=
	Hyg5EEDUeL/GoRiYc3xx7vpTNbB7F1PozN9R1RTI3mOjZfoJGVloe2O7nRvF/2JE
	UynwWPregR136JjhLw6FJIevchbg6F4KL9L9SIQ2kjJpVYo3HNsPrtNz93nqN6GC
	D//eel2i0LDZD36CDMHRZYJmHOvqYHCsMoRitO5+c+IJ5G7BGaxAToG3jRmHuJC8
	/HsFifa71xEGTy1yWvAnRlQeLS4uD67Ypf5h8VFeG14lqOa19uNUkBZ0XBYwy9ok
	TtHvv7LZxT9s+PNO3g4gyJTk+anLZsyfy5MC6MZsTv4TxntoUda5IBid889BuRyM
	eqsAzHFGEgOQ34uFHegQ4Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5c80te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 04:13:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XfJD036023;
	Sat, 12 Oct 2024 04:13:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjaj8bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 04:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLh9ZQo3elAD/WLGLcK9kzaQt4G4vq6dx8oeLKWph5QF0BEW7XNmJUiMNjhT5qVxTF7jUiV62oMpUp9IywXfJjzkjJFMapiiQcyqxkIbQuWle6Ef7rkuZvF4SielBEpNgF/Cug9tsBZXpR1kjnmvCEhY44H7FcyYAWL5ljjGZGLgHBPc0/Km6W/uU97XgDPQv+CQN7Wn0vIdH1axRfnLjhb4io0EIMYqku8xGSHmaFKMWolAYrBKoyCv1lhpI1YtU9xeYpPpRUhYxnca+5JM6rgv2ZepgAgLDPzhXRplNNDgDNziZvjzcflm2Dr1XPeYA4KI64gC397Sz/b6Q5hvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZBRi/bnd1Bs7jtbCznWqSk62XhlnB0tkpdoiBE2bsE=;
 b=IabTGNy8a/vYgQ74MUw8lIA8YToEc18LI3wf2v+W9rHs33ZS3OhV2oXW4p/f+I0M+F9s9yXfdSa5tmGiv45Wd46xOzCu6OOMSVgzcNW55k7LkJblqW95dcbXAf8QpbaOgFIDuLNdZ4YtRC2L7PvQSLgG17BK+a2nwdNAA1hxGTUH5k+huou/QSN4uyDlTs0YMyAMQmzSJiMkCOxhxrjemqAprqqo33trlCch4AgQqKL0lBhrkIcH5cTRoy7hScI/p6ok4tirrzn1gOnRwdie9APjHXq4AeToSurF53l4r6Zp0oDbkAgGtYX9O0bmiDhXLkx3S4r0vOuOeSxjMtXvzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZBRi/bnd1Bs7jtbCznWqSk62XhlnB0tkpdoiBE2bsE=;
 b=eNWsADSjbzwkJGtvVmEIidYPTvn/RB3oY0aKIR1/gNU85jmdO0ah+N8Hi2w+DgNBtPoUYMrMPP3d3QplrPYBiDL/6NjmIQaxfIBchhMQs5OHdk+rczWGV3HhgvUkkq5Xl70hR3eJm3faZ1M6Y8uLgeVrDnxsYMrHRweRvlsc6mw=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM6PR10MB4300.namprd10.prod.outlook.com (2603:10b6:5:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 04:13:38 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 04:13:38 +0000
Date: Sat, 12 Oct 2024 00:13:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
Subject: Re: [PATCH 3/3] test: fix exit code in tst.newprobes.sh
Message-ID: <Zwn3bTM5yDP/zGOY@oracle.com>
References: <cover.1724112622.git.sam@gentoo.org>
 <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
 <ZwntG33P5oU7pt9t@oracle.com>
 <a509486a-47d9-5dfa-ad54-5a91bec6169c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a509486a-47d9-5dfa-ad54-5a91bec6169c@oracle.com>
X-ClientProxiedBy: LO4P123CA0410.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM6PR10MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: f4286ff4-5740-4fb3-1572-08dcea743f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?zVRW0mqcD/rtf+UXvZf6XAXSq3nMmE0t/g6LqBzfJnCG1wJ9zduMGDk2Mo?=
 =?iso-8859-1?Q?0+mRHy2XjtvFWFyvD1+RkQaJ04aLbdc9VI0QoVWNcxEl0NVKdKXjZKE4hm?=
 =?iso-8859-1?Q?7iyW9uXDfIlVIWx+bLfK9bEk7ZvAsCGcR/iHDplvsXjIg0WLZgDm5kTa0N?=
 =?iso-8859-1?Q?dwaETfd2SrnijJCll7A/1/Y8FOqj4551jjc/vtTcz0Y8GWBl7HGcFIr0HW?=
 =?iso-8859-1?Q?C35SWBDqX3i/8PZZGMbukhgUjPiI8W9wd0mT0t+GpLsN9gTWfcOLlOPI7r?=
 =?iso-8859-1?Q?0eQjaerxHxdZERoMudhfJU7V56u59TxwC4y27RxQTeZ7h4pz4xapok66YN?=
 =?iso-8859-1?Q?ZfYovwWeLvQ2/miwwLWyg+1m7y/mlZ83jhkLYw1tW90PlIiM4k3JeyJqNl?=
 =?iso-8859-1?Q?I2zziqo1hLvXyF2AlPzLlPdTaaP9UfQskyxuBdPODgae2LqZeIqsDQngPJ?=
 =?iso-8859-1?Q?g7e57k+TNBMuZdv3W6xM6x7GQBIOU7MOwOFJe3hBbTHWjNsGpSPBLdP5fT?=
 =?iso-8859-1?Q?feJxsrpdLiKpYmt2LdGdnFLtBoNo1UWjST+tHk1gHLbF14aydce4t3+g+q?=
 =?iso-8859-1?Q?JEcLIP2iXHiDin6J5z8HmziSKa3/2LCa8yC5lK/j5xuCo4lVK49nmuF2Dl?=
 =?iso-8859-1?Q?2FN7F/d4NDVjIFWa+rkwCeq0t78v08A6IKBXs3m1BHP2DTPJQ0TqPllS5/?=
 =?iso-8859-1?Q?2r0dawsFw9T+pGpNMn86NZ611c3puKqD0wWnI2B1a/8S4s1yO14bFnNRkq?=
 =?iso-8859-1?Q?YGBKBL21jB9X8C6AYhbuCqDVtm5PU3yAMUOyZd+O7HrKwfsL8jfwBIvhgZ?=
 =?iso-8859-1?Q?ffGdPgzCdTeL3kEZzNKcwH5QM2uj/o7qMDTS1SjPbABuK9GnVu9vl2HFrE?=
 =?iso-8859-1?Q?sagbJLWtf3upI4MyOMgvIJzpxHMbLSXMdMsuV/O/QlNp5e52b14RPmWT2L?=
 =?iso-8859-1?Q?UzXTq2q3sBlm9iXbVGGgZ8U32s/VxF7DheqAsRVPOn6J9GveFA38TxilEB?=
 =?iso-8859-1?Q?VEMyQ5A4xSEJoP4nBIJTy34jggjfbpA5Vevg2yMJ5TAAOERyiR7WzK7e6K?=
 =?iso-8859-1?Q?lh2101l+XEFmC3sraY78J5yUYHyqJcH2EdTzERePxFF+5jKTemHFSastFZ?=
 =?iso-8859-1?Q?PhpcCGtN3hqomDWOvD7NGplMl3kqQMJmF9Bf4yZDdh2bH7DkDfvCDSgWXc?=
 =?iso-8859-1?Q?6VEKcnH2cDTP8vdWXLuGTKWeL8oWTuGCL5jZznBiFfinS3+56AhUUEP2kX?=
 =?iso-8859-1?Q?wu2H7JXm8bOWTEc4nXcwIo1ml1jEIQRf/ywJPq8UyeEPawNhi5KtSYPD7x?=
 =?iso-8859-1?Q?hURemLm1Nda/RErXRmL7d7rvLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?aJuiv8QHnfb5lOEJEuJuH63FMwFtTlxVs54aAM0HpOnRvB5uYH1QBUvAEO?=
 =?iso-8859-1?Q?ES8OguyLjVFWZtvnY0hSWWHalu+8SpCRxWP0sFoMykrqfMPr9x+8pMJBuv?=
 =?iso-8859-1?Q?AME88lEEuaKeQ3C7mjnZgsdVf6MUCRgsFC/6akkVlSg+wu/Ev+iu4P37lz?=
 =?iso-8859-1?Q?9nmDNWCZn5XQdp9CXtOlkpBYzTStnOqI5t7tOuCECE561qhwVwb5q0+vjn?=
 =?iso-8859-1?Q?PxQajv6F+ykl9rDKF5Byy6K+t6bpfUqHYmnwH3TRbHNslzcsEskPb0SLCr?=
 =?iso-8859-1?Q?ttdyTBgIRk29EPhhAbKR0m+EeokbbpcNY/nPTbzsrLmCNMuOJxSzehpf6z?=
 =?iso-8859-1?Q?sn/3Fp21ukoDWsATTbBfZ9AQGLLBT925HTU+mIzxx2fYRfkp/8kEjAlZ9Z?=
 =?iso-8859-1?Q?gbiVA1vjGsqrAKDUTPUPS9Ew6hNDHv7aj0sidI/zAOFeKqmyRP8YdZkukY?=
 =?iso-8859-1?Q?Vm+eXaXr7mYR0FDepZRF1FoKNn/7jTelVZpRQ/6zBKqQrsaf0iiybzH//m?=
 =?iso-8859-1?Q?JLe0fa1q5ol/P8s15ID5v6XB3+wNNDluqxkMDvRrm59nO16d+RMEJvR0dj?=
 =?iso-8859-1?Q?u8fLP/Vve6umFSv7ch66V6mQAjtVXQ4Hr7zQstHAQvR76cFusOuNfmI8B2?=
 =?iso-8859-1?Q?MIDJ917hWrCha1CzDMcRLWSDIu9bm/vzddNwJWAGtXYpmUKTELbOEekIZO?=
 =?iso-8859-1?Q?HSEADhX31V102HtgksI42Ys6ZVO2s2bx+zvN9kCfhk8C4BN0Kxls8JoMN9?=
 =?iso-8859-1?Q?p5Obq5IJDvqCMMKwi1J4FEO0FlboIbwW3FLb3mwjCS7igj8P1k7O/nqNoU?=
 =?iso-8859-1?Q?hym6tiusTcwROzWYXT8+die17Zfxrg7hJtZJVOvsDbwr5ydIIaGA0ggIO/?=
 =?iso-8859-1?Q?MgiiFYg5n/Hp1SzUw2MmNFeuflP5jJEEStvqrMXjnkqIbjDL7K3Ka8ib4J?=
 =?iso-8859-1?Q?+HC9F1kh5fOuie4je3wgf8eQHKaaMRv1t3GHE2oudEKHs4WglJUg5i/eR8?=
 =?iso-8859-1?Q?KtBpFgtlABl4ENexeM5DgF/8vo23BwADfW8b3d7IHWq4kUa+HWGUT01hGy?=
 =?iso-8859-1?Q?BzuZSYvA8LRQd0dQmmpt3k0FEIv/sE2P8E0wBSJ/3CA7ueRDCR64pnyaCl?=
 =?iso-8859-1?Q?vzgkRwhbhfDyoeaCGfAjWKVzZ3qoyhUEyTpzMifffC9Ei1RXoT1xU2NgC9?=
 =?iso-8859-1?Q?w3HR/FLi24nMaH5AcTMvPgR7acaj0aGcmXHGCqVXXlQiQF0/DMfRPPhxKa?=
 =?iso-8859-1?Q?UejcUOBBOSQRLTOdjMpQOuNbcCx5yFBcoaEpH70G5OPw/RGrytQr+ONk3n?=
 =?iso-8859-1?Q?oPyiH5wUTIjfzRGdMA0+/PjcFFsCkijIqAb72gL4IrfFL1d14Hnl9nCEae?=
 =?iso-8859-1?Q?jwlkF4xP5xmrsaE1n9M7qBTF2UE+XMsypXFhTwywWMzalbqjkBQPnR0g2j?=
 =?iso-8859-1?Q?d/uQsg2+4hFGwbMxPnf8dmtjLGPGa0Oa3oxsLwlk1GlqAHl8m0pVD5wK5u?=
 =?iso-8859-1?Q?g3oL1p3XwAs7Hs/7KGj92db7RYsFrL4Dm6gMpKWdmwc57qAn7lktlK+Qvy?=
 =?iso-8859-1?Q?RsjN21vAEQG0qn5Cq4u+p8CqejiOIoCz3YU4cnRq8ADnpzxdnrM3RS98iR?=
 =?iso-8859-1?Q?CbuAa0hDSPxVmrDPt1BvoCsIh96cLeDjAVdy1a2E16vH1yiYkS5Aw/OQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0hASBTfnrzRCv5zw9pAA3JBK4+XEowr2cF4w7KfjT2at9D2HxWQZ9jQkvaMzwsyYrSeOlQ9qcxWO+7q0MFyDcU2YMTEMJh/ze5/1Jx5WmBxQ6urkcR+PLjPEyJ2h0B3X/oCAA3NSBVnNC/C4m/5A19sIZCQXwG5DLpRf3xHwQlXkY/+eeZ/2AeM5DFoIfPE91zmCQ/9GrP8dkMSNh6GIa+ko8d3x7610We9PFIa5IdxfbuDuf0JlPnP7DB4Td4x+q/dOVlMLtEHhSlvI93OMN0os487oAZ+m0xPG6Tq7+O1+s0CQioT7wks7g+quZhKQlUc8YZDQTVEbMeK5U4n8UsIm5mP2DWW0HdLlIzymfG5TD/Ain72rGoOOtGLA3bxDn5WdjdJj/UysYCYKbDqhg5Ac2im684//9TSGnph9bpwPRb/Z92uRZUlFKjaXWHY2aH+0jqM4zWPXDgbedM5Qs8an2oE1TRR+AwmajmJkjO2jspVeLA1sSOlznCheQ8dJN40LttJkoJ3jNGw8TXnjdreVw6FolFHXzcyWL3kb5oUCmzLW7eFMtOzinopzdlzRCzjquWFYsov5itqBrtmbcT8HmpJSCH0yyhD8cxd9Fxw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4286ff4-5740-4fb3-1572-08dcea743f5b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 04:13:38.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+SnPS1jkrJWvvGNYf+KQ3NNlWRLW8kGEjaBdp4nB/FxLOYmc2BI+fMKiZ3j6j7K94oGPyOfyqqzniLPLoJ0/Ccbt0Oa9WkYlxgxPyEYNFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120024
X-Proofpoint-ORIG-GUID: Dubz7OAip5jfN5wnjb67g3lpURQwUn0y
X-Proofpoint-GUID: Dubz7OAip5jfN5wnjb67g3lpURQwUn0y

On Fri, Oct 11, 2024 at 11:55:33PM -0400, Eugene Loh wrote:
> Maybe I am a few patches behind.  I thought this test used pid*:awk:: and
> was therefore XFAIL.  I do not object to the patch, but I was only curious
> if we wanted a "real fix" to the test. There are other cases where tests
> have multiple problems and we do not generally seem to settle for fixing
> only one of the problems. Again, though, I'm okay with the patch... it's an
> improvement over what's there.

In general, yes, when we encounter a case like this we tend to fix other more
fundamental problems with the test.  In this case, since it is part of a larger
series of test clean up work, I took it as-is so as to not delay the cleanup
any longer.  But yes, the test will still need extra work to ensure it is
actually correct in terms of functionality.

> On 10/11/24 23:29, Kris Van Hees wrote:
> > On Tue, Aug 20, 2024 at 01:10:22AM +0100, Sam James wrote:
> > > $status is never assigned, just use $?.
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > 
> > ... and committed with Signed-off-by added.
> > 
> > > ---
> > >   test/unittest/pid/tst.newprobes.sh | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
> > > index a4944688..0980d3b3 100755
> > > --- a/test/unittest/pid/tst.newprobes.sh
> > > +++ b/test/unittest/pid/tst.newprobes.sh
> > > @@ -44,4 +44,4 @@ tick-1s
> > >   }
> > >   EOF
> > > -exit $status
> > > +exit $?
> > > -- 
> > > 2.46.0
> > > 
