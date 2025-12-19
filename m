Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25252D0C92
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124690; cv=fail; b=mC7NgwrX/Kc7ZexFjgLb8WmqIe+JHlVBUnFQdSSZo6nm8Ixpr1CtwKy651zpYbiwh+etzuRJZAwepT4XlGI7RfBcjcJCT+dNFPi7jGfVWawqZosN5NAWzlADtGx+niowV4ofbI2wdudiR1T0T49otQARonEFjx7xgTt/ybvuD6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124690; c=relaxed/simple;
	bh=JQoUE4GIGLrNzqiXEXxs0EdDR5cotrech8G/U5yFnVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=euJv7o6QnCFMrFNunohKGpLks9aDtX8UPc5yWPiA0Y2xzJjW9twG7ra9QUkq6zzb87ZoYC2NHb/Tw6GrC4SQHQQrHs31VlaItxV3VKGjsVx1bX8ohCk3BWHpOxHU9bzG/H0OJzLNSNgRoXUUWZvm6ESs8LKxcCXdQRSU4ssnb9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j8iPueql; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mhKoaXQt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j8iPueql";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mhKoaXQt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3Ed592694769
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oLIYDZFpvQH51RS+rH
	EdWZk+5kWsJ+Q/CuBO8t80+WY=; b=j8iPueqlRtMa/cDCnZkrsMll4u9kqZcyqm
	3EIiy3aYMB/ZK+cwM38jlCKi61L9NXPMW0w4esLedIbdaigeFSMmUm10rfshcmWj
	tFVo+S4qQpdWs95pmbanmRiodRgU67Oiq+deHsykBUY+Px6No7Srt6S+J5z9kTX5
	BObRg/zOa5+rZuKn3yCfatcphgaAriyUm2uXWxSyNXynjeO08JOPwV8sgGpopUUm
	/bQZRGYlrRnYHOF2Ae8Hp+4t3oIUgvFh3qTEe50OO58iVNkKirguVsogrlPFzRji
	4b4j5mwLusumSEZA1IKogzp/reIHHJsTg+f+ZG1OuB8XwDfmbtrg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r290hxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:11:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ4fwrX023551
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:11:27 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtag6gt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIMonkPh7TpSAkNcCcmhoCgGwKHziuFpLU+P84ThwSuw/NUU9SLmEbrB1t8KhEDBPTW61Tb6G5RcsysHF91gxVq2uqWXZoxOjB0g5wt25QaHvXTJqHHy+CJGGEdJGao5KfqW+BxO7/Q3gMpOgWmq2FzkWKpAtkdeBdjcwKFAteFCiNkqVOoFj39VHuNzB/7skb7egi18GqNe90zGeH/zK0bN8D/BIOiKnif5jK74d4BnzDCATpT//Z3F9Z2K3kXSYWHR4uA/BVO7eUgMfLlHD9WzMn3l0pQ00qE1Uyuawt3KGaEJQDHW50V4ofs0KYyihcrZeIbZt+t2lWJ7CyjikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLIYDZFpvQH51RS+rHEdWZk+5kWsJ+Q/CuBO8t80+WY=;
 b=DXetGqCgFyTEqqevotfYYId/ZpbWzeSAf9lshdaSWuikycwDxG/en0ahTwBH3SPRYsYpL8mbeFCX1TLoSUvAG9gVrKFjsuxCe0I+8kr9Ipn5dqutskBhDpZkgY8rNRQgBI3iswgfwlpCzLBUCfTFQg73NyoR8FaIFQmje7JpaW7jR45xx7PDIkJTiQP+tyI2lQpg+e1CmIocQwq+DirImiW2dCSeHQFTsUacx3y7fQYqRMQjbClZhE3jKZSklnREsx/yLXh7JsriNyUSCDk/pMJ3NMJW2CiUdUdJeDNNt6IKNOCo2zGGB+DkQCP4MwI1/f1uNT+PIa6heRHRTFqY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLIYDZFpvQH51RS+rHEdWZk+5kWsJ+Q/CuBO8t80+WY=;
 b=mhKoaXQt3ZSG8kVNG9WYCo/szzlOM6vC9r3QPo6AScfGd863QP5lyCIZI3M2DK+Y1jp/ZxxhdyCSTf9dYxP5U+rwKwPMTx+XcUmqId1+7sRDap2G1aE/+iv3/jXK6Zr8eczUD1WSfo9nqzwzs/UrsYBPIH76BLVC3bn/BguxV+M=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV8PR10MB7989.namprd10.prod.outlook.com (2603:10b6:408:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:11:24 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 06:11:24 +0000
Date: Fri, 19 Dec 2025 01:11:22 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] Fix comments in rawtp provider
Message-ID: <aUTsiknMoqQU4kR8@oracle.com>
References: <20251208054114.28036-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208054114.28036-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV8PR10MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: af46f784-104b-4aa1-75cc-08de3ec5700a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CtFcEJXeboFqdgVJDzoUvmrPF4jBmW5kn5PaBOBH1mvrx10C0aI/dZbjhk7d?=
 =?us-ascii?Q?7NwHviw5G/kOMw/g38Zs6jlOcEzWoyCKGVEOPgkCMvsT5WrbztDH7NimoXst?=
 =?us-ascii?Q?N9kfFq+M2wNCDqUQ3IsLxz+zPKYNHU8DmH3QCwJwJdluFdnO6d7OAlSfj5/A?=
 =?us-ascii?Q?mq0x5MDfk914oDbj+JPaVodW0g+5acq6nKTDB2rkYR0ZrH9tQq6Z4vkNllk+?=
 =?us-ascii?Q?wk1bjxFHJARX/i3lByvpJWPkx89jkd41Xs3zN0iDglWTUutcMseZJisroAfg?=
 =?us-ascii?Q?l5RpsL7Z2ur1tyOuS2XPVhfZ0SDO6ARB1JWsJNcBq6f3Ww2DLRd1DhWQC53S?=
 =?us-ascii?Q?kHIUGU9kqyy66hff9BAW6/kXuDefAqKTrGCSso+R1EWvORoqbn7FyxKz15Te?=
 =?us-ascii?Q?TW8I+J/zVv+ODv03bh13Jfd7jTpnsekGtOJjYNxtT9FpbrwD40t1n3w09Ib0?=
 =?us-ascii?Q?Ieg5/xRZ1O+01hS9RReiP2rClVRCAGKPxuNS1dbyDoa9xRYnmLFAyxi/z0rt?=
 =?us-ascii?Q?oFhav2cXgsiZFgYLiNF7uyXv4/l8+kh6jDdf0rzgQWP9exjSEhQscsIqUvp/?=
 =?us-ascii?Q?td3KbfAolxJaTuzwjisHlGuJbeW/HOJWU25bvh/K9umlaHuev/sc8WRPnPBM?=
 =?us-ascii?Q?Jpm/vyVQENTjHneTMaTj2WETbDZPtqDgpapU97E7j89OtsBfimuq2A0qIH14?=
 =?us-ascii?Q?OhNnh/iips+YQM/WEzldjolM/HJ9B3T20OCFEmRxZ1ap6jcTnrzGTpyNgU2a?=
 =?us-ascii?Q?WkajFp0HGJr+JLxq1ch4JNwffOiW1i5tHJWoHqhWWo0cny0uJFDMJbVpCZR5?=
 =?us-ascii?Q?8Qj7cUY0Mx8ohPygKklwmXeG45vk5PiQN6tKuMEu6Sqcv82VSFy2U6SMrUSw?=
 =?us-ascii?Q?B7SWg6uRSL+KLrqaInqnG/Ti0/bItDdbh6cI0fTAV5DowF18wYXoZBpT25eD?=
 =?us-ascii?Q?LsaD1btJcB6lZCu3aVvL5M3cDU/HBZ+UUNRbBmqBBd8z2rjW+oM4uT5bQujY?=
 =?us-ascii?Q?x/fCL3HqGEtp8L4wT+TuVt6ISje5eTBavgJ8siHc4+u3rEpkm3bLuIB7ex0i?=
 =?us-ascii?Q?3TA2yS2WMh59Y2fIY7fmAJ5/8jx/ZAY+vlBuc2pCJBeKgqALDaBexy8LjQwu?=
 =?us-ascii?Q?XiM7YRohZd/+Ee9HnadGy2QW4hbH553j+hxZpHvXr5kqM+T7t92qSH30BwmS?=
 =?us-ascii?Q?Y//+VAk63AH0tkowZ44qb+Pc/zyzuIcA149N7VKW/jUzVYZRxcbyVJtVBY8j?=
 =?us-ascii?Q?6aEbTxEz1p/w27jsdD2syE119UxCqZg9QTQtmWYsrVh/exVA2EbZujWpd5pt?=
 =?us-ascii?Q?BTBnp55Z6nam55an/26cheA0zUT0/1tMSugZtC/wlBZasDmmwsOSy6mWSYB4?=
 =?us-ascii?Q?S/jRI1tBfEx8O2ZCtpEJtT8YaxMyVvK/dm13aU02qhcsWwYnQG0uEQVTnBsD?=
 =?us-ascii?Q?JOY2/3L5ollVaOVAm1t8bbduPKSiSRuP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f54P5t9W52Ra8Y7E0v55h5v3JG8rhzuOVMdI8jKBoAJmXCl5wYatdPm1vlol?=
 =?us-ascii?Q?8hJ3EzPZ8JAx6vg/ycwR5oEIn8XM6yneN7Jo6X8t/GSqaxoI+IxAy3goTTs4?=
 =?us-ascii?Q?HvfGSaXKETyPyEyTRhIOgDls2kyhd0ef3t9NRgISa/fX2Ppja/KhnIi3uWSc?=
 =?us-ascii?Q?qoWa6aW95XbqwX0sCNCU5KU/gnfHf37u3JREaVm65UdgodIQhSyNt5+ihHVP?=
 =?us-ascii?Q?dlTMZUN4G21gEcQJH+ncbVD3e+swchZRBSm0boKxQtZzuSR2ZMGWxkRPhB9p?=
 =?us-ascii?Q?Aauu9M/HUyJx7KPPD+KdTSyNcKgDIlTr2n0vlD0DNsP/MD6AYr7EeMQl3JdQ?=
 =?us-ascii?Q?KnpJsRRhduncY76zIM5qhS6r5sfpzQbX8kZrNNz6mk7IDCnA3u/S8Qf9MEPv?=
 =?us-ascii?Q?3kvFQzHoR7TdEPftFsYojS7C6c1L2diwuQgBqWR4H1OQ0qTPb22IHvJ5KO0j?=
 =?us-ascii?Q?FT3wJqsWCrAfG/Ff7fLa0hxjdGkv5hR+1a9QWArOkBC+B/BuG8OsB6NeqDDp?=
 =?us-ascii?Q?DIBJmVsyx/kcW+PG46fE72GXnnGsBl++lXSSwcpDv+9xyHG+pYC0/PLtQica?=
 =?us-ascii?Q?L9zZTVKg5jco9kApniqJfwiAfY0hYsjSAKelAApLE/k53dLcT66HaOeRUweM?=
 =?us-ascii?Q?Ix0Fi/qnuBaPu1sRMdhMXrn3MDlm+D0B3MpbEkbJAGBAhwk1uNbcS+dUrZv7?=
 =?us-ascii?Q?cniHmzAHKwCWAS2yk7nsnL8w2gr54pCFBWbC3Mbj+wjiVqzbQOv+PAGDBiA8?=
 =?us-ascii?Q?MjpB2x8pupkzLkZAaMUpbRvUvKZGMDJYeImZFcUMROO9y+8x7zY8/FbY4IUq?=
 =?us-ascii?Q?Or4ys2wTA2r+CWMvdVPgbBpZwBSW8KbfmO65HeebsmPfI5AgKGaICN/UmwtF?=
 =?us-ascii?Q?9AmhpzceHUIrE2sBS0S6Vykpcy6jnQ41mMYbtjPVdF1OQ7LT7Z3/eIdL6i2y?=
 =?us-ascii?Q?HrGLzQ7jsgmu5hP2+PADfK/aolLNUXgLvWpF+FTG+IisrOSwsvMU6NDzW1ev?=
 =?us-ascii?Q?pOwGE5nM44uulnK7Y6mpD2y5GlhzR7eJXZorbSosvi2MExZ8oFFKEWr/EkcM?=
 =?us-ascii?Q?btcgeN1nk+9pbCiXI8dIQG3NcVUmQmhGfJUcf9MPyEkEk3jwuywE7Tm/Ntp0?=
 =?us-ascii?Q?Q4IKu1UEdKwvQr7eiBfdgfesHlPiwRnL6RPTZ3xu9fLyZSFeA1UI9Qh0f8y5?=
 =?us-ascii?Q?+SDbwXnSWiyx4Uumjomf2L24aBqEd99Kf7kUI12GA0kqZIvVTH2V2jJtu4OG?=
 =?us-ascii?Q?75Ow0ntrSCMdvaAXGRPC3jmZYZN4oXAAEw57J2l9RXqExF2JH3xY73YHgOvW?=
 =?us-ascii?Q?l87HdwMo2ueqDV5/EgiHBjtj8x1QXliuYEord9TrzMUXctM0J6a2lJSziBE6?=
 =?us-ascii?Q?4N2MxfBV6bsf7YyIuWSAYYbZY8boNVZRm21bf5raqZYdhdq4XTL9vJiV+NPr?=
 =?us-ascii?Q?jPXAB5alSPS5hAF1eMxtJoVrfg7mG9q402HHDNvnrkhCa5Tt0Z48NZGBQ779?=
 =?us-ascii?Q?4de9KWqgDDggBCj6+vllZLGbSM8hxrXQV9WljBihygghbTXQoygRweRoHBVy?=
 =?us-ascii?Q?0ycTBtx7VKWA+3hn8cwMjGaej5i6Pu6eA6ifVBUAmtg6xF9iMVNT+MrvVAiM?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	orE3kVPh3th20/eb9COVaDXMcn/YwM83mC9I5zwkUUK4KwnoAxzxFxrXhb+t0w5EmgK0L8Ot/fEymwn3mrn+IM+MxT1e7aGwn3EovEho5jvLVANGG6Zn7DrBMHlKBzaAnyRSRV+uNUy5ImrnSvnUzq6QfY87FuuoDoLpLiKzItInofMUMFPIz7uJhgwueZIgD1Rr4oldAtgnjkEfDZQb5PbDlWDd9BWOM6IZiDQBY7krN3kVjiNhcdPtJQd+IaO+mx7uV/A9DV4JFxhgIQRfVZiaC67c3F53QIpJtrFMrZ9DSgNmyBjsJLzUd0jzAWeLmEkNsM7EI4lw6DXQouHNPgZsHVewG116kCaL23ZEBy1rf++1BA59XyiZErJNjaIbG5TmnFp4Pi+Ms+V7lDabGtCeMh7QbDNOUsZsF7eMBUWUrOd3Z/2nDfvxYlsG7ipdylm51TvDZqa/KdLXuW3LS7Nnnlm7pQDD6rN/RLH0BNj95rfP2YRAFQylzwq3ZKH/chNzUXBLk4PwXqC7UnVnV+e5QsxZNiC7/CeuT2ACFrdijKyInSyzWLxYfXBbbgHHD79NvS6GmBs29Ao/2uVzByV9KsTBfNrq/34nE1n6p0o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af46f784-104b-4aa1-75cc-08de3ec5700a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:11:24.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZJXpRQXBeTe99KdOBq+ugT7vtvgMrc2W5LI4pFeDgBdMtSFDf/qfybeL+XmC5HGMOB44dhpSBFmVvo47wluNUIXmOcL8IJgBcmVVlc73BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512190049
X-Proofpoint-ORIG-GUID: C78o1a0AexLcYfEDhgI7qz0UOGpcOw-X
X-Proofpoint-GUID: C78o1a0AexLcYfEDhgI7qz0UOGpcOw-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0OSBTYWx0ZWRfXxQKwenrm7tD5
 Biy9GNfAMLvk7BIbVSMSVNNqPz0k21vCby5s3u7QXhB8rm+X89dNZLLttBKnBjLSTEpSr9+OfwO
 DQDY/OqRdn7jeGaen0alX9Rgsp7QcP7IK44QddN2O84swctoJ3h6ckSYjeI9SEa1Tkjk5kUU4nN
 QnjqOYDnFBtsqs7NQSVOrMygJptcHCOg8zgkhp69PnR4R2kA8Szc+CAXElZhrJ3qjiiWweUCF95
 oFzf6c9rjVadpP88ejyTuVuawXjdDhXfMxSCzySrkrxIxAot2nvQ+5JBSnuWnwA78x/oCqITOry
 NFj9ZPFlNoehVR9o/5gSqrSC2y4l4BaIhhL7Kx7b+jC1jJ+qgPBMdXvG1d8kIrZOk1nksbqlLPo
 fcQaZ/S3zo+XXMc+HjoOcEnXoX045vqoNMFRMJGfcE0poqNczCT9QEFJXgul73N2zA/W5KZvKjE
 PvWKA+jZfFOc7dB3NTg==
X-Authority-Analysis: v=2.4 cv=efkwvrEH c=1 sm=1 tr=0 ts=6944ec8f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=6mTWHuwD_vXiDxj2cUwA:9 a=CjuIK1q_8ugA:10

On Mon, Dec 08, 2025 at 12:41:13AM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_rawtp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index a36bb51f4..709f7040f 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -118,9 +118,9 @@ static int populate(dtrace_hdl_t *dtp)
>  }
>  
>  /*
> - * Generate a BPF trampoline for a SDT probe.
> + * Generate a BPF trampoline for a rawtp probe.
>   *
> - * The trampoline function is called when a SDT probe triggers, and it must
> + * The trampoline function is called when a rawtp probe triggers, and it must
>   * satisfy the following prototype:
>   *
>   *	int dt_rawtp(void *data)
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
