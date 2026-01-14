Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132035E539
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425028; cv=fail; b=GMCrnQQ89VR8Vmy2FBxxjmruYSuJWUhVEP+LBF9eb1kNNQE2DRe6UiU2tiJoDhuOlKGvbsQ+ZfGiynKqeXAYy1j+enl0U+rX3IWJsJF/msBMHVGZTZv8eNQ5nlVmK3A/njr2FidVvWg3sFMXpOFLKkwcVYNR61INPaYCnx9rfYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425028; c=relaxed/simple;
	bh=HyZKAOqoRmX3bmuW4pjBfRLNyjkYwfef7B9R0JBEYOU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fWSo9yPu2SPCWFp6kpzzZDTB6I5Mib/KqmYDLti02EMRJwHhaocMxwW886ta0mAJApCea1U4O8+VonSldUwSCeUABAwvucEKtiBZswP2FuQlVewFpkwfCjSQyqY8zpf1QhftjSzgsYQQ+9y8aMT9iZFzWFxpE5geqBCL2gMxTS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bU3rakFe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qykBUl2a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bU3rakFe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qykBUl2a"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHuwiL1362590
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=6wKtDMfj/9GoLo+aR2nLZounKvmF74g5I6I03tBwXIw=; b=
	bU3rakFezNKSMrztrW9GW6FNONl4QXbbGAzq9/IdBcUZDZe2apiyY2ubL3LesMr5
	CZpZ1i9j5rU+Qj7JAqTVWRIJhxK+jYP9jP4ZpaPyROmc6M7nzeJ/kC9K7z01NVQO
	7kUm2LG7XuLNWQYnnlpm9Zec922AcUhSHGGV1PuQrwOGJU8mNUvS/Urm31KkLGYx
	p2vl3Gqy162Co3Ed6UNqiAvKjo0YMax2YV9ELddEdqzjIPggz5PWssI0/yGex4iK
	10jlfTrY90ETckoJTur1zSRRLMO/LYmoTCNhYFwSnJBjXRvY2BiDQMJ6HfIDqdO7
	uJT26kc86qm6dcgr8291zQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp18jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:10:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60EL0ti7032734
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:10:21 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7ajch4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:10:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3JPNUtb8OwXRDAg6oQIPh8DsW9BYjJpIgjby0sZdm08b8mgjUK0fGqPumZ8vm9JmioAFCC4eLzPSluBk2zxNJjh3Ld0OyP6PqlO7e6uB6X8/dXSfUS4qR1LLQI88C7drT3S1KqQduRs+x2HXucyoHx2MA1eY2Usu73WV+TjVNKjLMETaLdTyze61LAdhBtDI8/2oyXuB8aGS0oiXv2Hcg/dn6P1CrzhvWEiTUraAMeXyRaOe1wLLulBX+xrXPkKxCPSVb1LvKvb/je8qf4c+m6UoRnprsTcGkkeCLF5uXj+q71wULm026SMHQi4TvrZzQXDklAIZTma4XU9xQZhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wKtDMfj/9GoLo+aR2nLZounKvmF74g5I6I03tBwXIw=;
 b=sYo+tv1PNVE/tt/5oUixJnlV0Bgetv+YkVBSJQF0QY61wFC2ABwqJr6sfDZQFpOd4FbKI/tQO5ZEuXX5XKSV9A6min1qAwK9gRy3dIppsSkc/gsfV5Supz6UUG6v6OnHLZwJobeircJOD7fT3cQuJVOoKNN+xCAsnRNulRdbbgaX3DnsnvgifGsaunz0HlcIERNSSNEgH2sGIlduK30AfSSSx0VG4SxVx/i1ehbVljG+SHOIcalAzgaXS9q41fAjLkHyVn45PJKztqJ+yo7iQmDUrop1Of320LbzPrAu4BuohuRBxc8YHXd/FxIHxJZg3KDhOQpSi0SxJRsuK7XYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wKtDMfj/9GoLo+aR2nLZounKvmF74g5I6I03tBwXIw=;
 b=qykBUl2aLM64eeFSL7ApSVF6kgbI5gjxtpku42fLuECiBCQyFZfP8W0BAjOWK3LU9XBdWn+sT8L1vrsxAJYYoy1D1yAZW9OlpMxG79c25fM6S7Wm2WS8NUkcfBbuh37pM+Hejuidw5iLxGdJGBbQr/wEa/4U4KmImmAjeYeKBS4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4672.namprd10.prod.outlook.com (2603:10b6:a03:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 21:10:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 21:10:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix printf formatting with non-monetary grouping chars
Date: Wed, 14 Jan 2026 16:10:18 -0500
Message-Id: <20260114211018.23412-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: a948d3a7-fe7e-4ba6-7676-08de53b15298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0AUHgVfbfDWxDjtQ/JKZmhOdVUNdEgmQJK3CUhsQup0YTs3fatynBhY0XU+5?=
 =?us-ascii?Q?F5+77GoqX7bvxsc1fe47ll3mNbVCVpOHHpnnLR8PpTKjQE0vXs5BqvGbCTDZ?=
 =?us-ascii?Q?Sv7ywFCKN/GiJqN8dzkCOdfl/NoCy/cBt2YthftLgQAaHIirZQkOuzLghePI?=
 =?us-ascii?Q?1IQYQL7Frp8naenx3zbyXXYtllFC2HJhREk1tOtSMcYDnZj2XebkPRXdau0V?=
 =?us-ascii?Q?DfwSJOYVefKkGvOzT99tCw14tWrEHJ9mkVlJ5HTtrOjLIBB/T+ywlaR6qhr7?=
 =?us-ascii?Q?4oFpf6KuozRPLTvBHXs66vOgQ33UQ1wC3MJ+vZ5RHTkeR0HTz18X9KKT/Umx?=
 =?us-ascii?Q?JJk+L0jVei3P91bo5bM1VIh4YYuZ8rvAdwRRJgK/nJhcAOcWSl2B1JBKdZeO?=
 =?us-ascii?Q?NTBLlA9qiuu78c1Zf9QJfQkWuXLWRB4lZ3T7FFqXFupJAXfBnQft+3q6Ec8Q?=
 =?us-ascii?Q?bVLgemZl2hn6v0BHiVcFZnYmrtgsOp4JcJyHMXmK3MKdqXZbbvVomfPLcimC?=
 =?us-ascii?Q?4aSv82kf/P6LuPcra1H1HhCqDMa0BHmQCDPYPt8TUUsJlDihn2yQMTp9V5ch?=
 =?us-ascii?Q?1E5BWKHC3VlVh3a61HLSmhVq13u9Ee5dhu5ZLx2pNaVIzPx24kWE+Ald6fZi?=
 =?us-ascii?Q?lR7CLnfVKOT+zuDLXP3lx9wKZene6CmW0OlA27CdoNqxuozKi3PC7NpfDiqq?=
 =?us-ascii?Q?0M6lcRx+2QDoiQKzgixLtMwtkRhHDyzSDRZKdgXv91SQ2BjpnflyxFuWRsGF?=
 =?us-ascii?Q?4csx6NPqf19WHb2Lqp/s5kLe11ql20R7LqQvJ/K3pXQO1l9hA6lGKJGnZJGi?=
 =?us-ascii?Q?olt+DKee4P9mhaU1y5tVogXW+R9CQFDRQqFtprqQUCIqu+yGr4XRjg4gyd8X?=
 =?us-ascii?Q?diXtFK1jY2fNix6L7oIERVziPxR0s4BlLou077zJg8T/ZmEKe0QN+6suH1RP?=
 =?us-ascii?Q?txVsXh+OVj8lnZFP5ZbCdnDxAT9rRTo4i5Q9AXCpAJXt5ROBpmJ348f7eKDF?=
 =?us-ascii?Q?75JMR3OOFewk/a5Qkx3OqaqMKUMJSbhYKeuCMLAhOlhA/hZWvnQx/Z8VQQrw?=
 =?us-ascii?Q?kI9sQ2GLPZoDMg7IjZ7A+LHLk/Whx3iFeSCtr/P9HtFkMsi355OJkir9gEew?=
 =?us-ascii?Q?gmhqsVhjNWawM3FuUba6WdY2YmPXn+Cw5+MU4v1gBLFFvfhAhn8mewIQ1+Hx?=
 =?us-ascii?Q?3mX2G5Si9LbXXpe0eV0sPBOwc60lOmwX1uuKnH5/Db0DAkh0/FWI8kWPI4CH?=
 =?us-ascii?Q?SuLYozev3Vt7d3PwGvwR4MLLBBx9S9e78zBCdNpgqjWH7Sr9XPX4BmWlh5ZL?=
 =?us-ascii?Q?aU3mHuGD+hpdW7otCXzCSsOi0YwPBx2t4SRWjc8xyd05E295NM9A7ln+QM8W?=
 =?us-ascii?Q?aV9aDr8i2IYQdUy4GSt9M7s9Ds32PmZmY/KZrOpAozej4gQXU25qOnNfHUzt?=
 =?us-ascii?Q?z6cOd8GFDMjjV8Mpw7NMQyKqtEhQLmNLf+HiLHEHtk3auH3H43Ij20JI8PaG?=
 =?us-ascii?Q?eHLXcHJKx8FVsyUaqPegdx/v7MmmumV6H6apYkFFoIkstCoHwtxihl0DBWw7?=
 =?us-ascii?Q?+U2o2CpJzrcgwJrSZnlO3h2frpwkF0dJCKgGeTdb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2OMYnRd+duM7xahjg7J/+c7OXUHmwohZ21VY+KDLIe9gvSxCjmAyej+8HgPd?=
 =?us-ascii?Q?jPmfMAx/RVsYSyGZcRoKKjUA3wKtuJEO/26RpJGX3Cit4wyxyjhW3Hz90oh9?=
 =?us-ascii?Q?qUdrreHb5XNSmC2D5EvT1rCxQfc8w0kGnB5fJCg+T6c1hgEuTi6SRkDzyI7p?=
 =?us-ascii?Q?Ju7I+8CAnFbKqezHw+ELti0JkGn4RLLaVUTQRY0diqdErpTdPzWpKAE+oSW6?=
 =?us-ascii?Q?oQtbcyDtizpOAeIQ005SKmBV9iXqb81Be5XpGjJaDXQj3n5Fzz8+pIBJydNt?=
 =?us-ascii?Q?EF1DEjCY2Zp3u+bkoQkj7ABbsOa/jTUYVTTB+AUWaC3Qemw/Xz+mSaShJy9z?=
 =?us-ascii?Q?XSUJAmV+vBMdh9br08AWa1ZmmW5Gtsgas3haHWSpZXKVtAUAbv0wyAUMvT25?=
 =?us-ascii?Q?ah9VVa/Xzn8MgGEZscgIW7XmD5m7oM0jbhiONlpjj0nk01lpiWJyhoNj/XR5?=
 =?us-ascii?Q?/a9ltU5QuNxvIjGvIe73zu321r3nnpp9GYECspaxrdxrh/IiSTXa1v1wRN2p?=
 =?us-ascii?Q?jrFAD+cs8jMkJFP07jSun4a+OQXthHv3J4kMNs1PUSW6BN5DHqn0AJMSDGZ0?=
 =?us-ascii?Q?BUOQz6heYxJjGLRqgESnEPP/G3dYM1QbVeMjnSgPhcucyEXBxmu2HbXCmBVZ?=
 =?us-ascii?Q?BpVJiixJPCM17b8gSK51wUZOA/PNGDMuFrgpHPPFn9CGpchYR3cKwiw7PyEK?=
 =?us-ascii?Q?HkDSZ5430cy1IB/mqS6gRorGSMpG63a9pfnZajVqcBf7S+5EnhPYjAqmqC3E?=
 =?us-ascii?Q?M+J9tXLFsITPdHFic+bI0Rb74Bh4nURGu9Kha8jjN1mFOtk0QtRNfO/DdpWc?=
 =?us-ascii?Q?FfeGVoGog3dcYbzkB4bhvgkKGXroQXkTBQXRt8KduRLDtTOzWcBRveTAGG28?=
 =?us-ascii?Q?QOWgA38iDHVXGY5eAGwFuJLTUO9GEaRDgSUGlevBWlVlUFaamZr6GB493tJ/?=
 =?us-ascii?Q?IXX+l7gXCTgpkCgG1Cpyv1v5lk+wmB4jLjn1EuKS8v2uZIys+d/+MKJKaB+S?=
 =?us-ascii?Q?HHsjH2+XRlJDS+bXCni+OfEVUMrbiwCLKSJZ93tFHJIPkol33P9uLVdd+Qwu?=
 =?us-ascii?Q?Rxjk7m/9HSsgHBCrnoMEG1h7x55NFYpL3ko1ScCZmnqBc0VWfaijPoQGqESS?=
 =?us-ascii?Q?TPM8naRFtQoNGvcVHZkctHjo4dzfdZfjSxgHHcV+ofQxsQUac2OJV+Q+ZQjC?=
 =?us-ascii?Q?O0FOJ+Q9t9DfjPN61BKSO6UVVAvLVrBJF51Fot0xNRVu/j2RCWR4JfJcJG/a?=
 =?us-ascii?Q?+BVISOAk8kHEkqQAX1P7b6et2PYeZtLHFLhMUTcogBEThWRJaz9dOzwkKXH4?=
 =?us-ascii?Q?uTVpr2rmrm8hfdt3IuqmPXCv9k2KYl8zjkRKtzfOIuIVC1GVb8+3org6nBJ4?=
 =?us-ascii?Q?wdNmVRASdeU01CSw+s46vZWWrKLKaFx/GKc/BRDxb/Dl38Kq7QhveFFKkPZh?=
 =?us-ascii?Q?ayh9bI3UPvORqy9T+qTNo8s6X2jKrm4B8bjrWJup+m0zvoSDHlQJvmijpPna?=
 =?us-ascii?Q?qY/GWEsf1Rf8nsT3DgOdSqn2dFmRLwL+tM4cpAGkZ+p26pC9wWzNEZICx5so?=
 =?us-ascii?Q?Mlag+Bm6LhKiBzdhwDbzkxyBUYAEGTKQ8RaHfdGQdVdE9TskVjeriUK5ajsg?=
 =?us-ascii?Q?IqwsAhH7WV/vFsO+nFAsu3sIoWx0Gsw5PvwDnMUe6vuqqXRf4c2utUIQFKr2?=
 =?us-ascii?Q?fv0dPQrcrE5v6QcrsVdirsYcN5dh3gzwEG/rNFUb/T5a48OaEeMPC2BSSa21?=
 =?us-ascii?Q?sCWRwkKHdQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9iUK4+eGEMj96FzZTAfC6RuJJfXZjYlRWWLXwAOwovm8nFWb/YcjpVqjdsjstaFi2qxVHpBagvqtsExhzFbFjyt6pZGBSdtwYlqlWa2KzKUhCidp9A4zONVditGFcIW0d+LJo+5kxTt3pUu2dbvgt/Ackd0Uq5WLMOOXXMvGurRN/htA4BCXMjhYj+VYBoAGCsg7vDXxgUStXQXq99Gq9D+J9hNjoKhsfA515Eh490U/OzM2NKk0V92x+2iWraBSuYpD3h/T9KL/ssqOllnJWjA2mroaHHTcXiCd7AuD+sgBFJNJQhyZAO1V1s9cQJAnZKN2lzGb18dkCuWTp/XguN/CrosB/8jKxaRIiIcpcR7l6VDd9V1cbiuF0adsHe0q1g0zQwEeoqjY5hHbOhDAroCqZLdU6UFCIb6qgbLP3sl3Ocghx5bKRbRMgl6zF8OAwJSuA6Cu6BWrIkS0DI6LvcyqFRMqP4+mGU0+pOoP2184qW4o3pQ0XXTjpgJV10io8GeR5onA9JWjBgkCfIJ9oxE1ckY8qFoSzQhFK9v55tBqJMhaQIf4WwkqS83d/KlCZ1xElJdh8FCFiGxftnQvY1Pk80fgfFwkZ4Nb6ig4W1M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a948d3a7-fe7e-4ba6-7676-08de53b15298
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 21:10:19.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHKkhqIZ1kLGoeXSQQBVRfUVTCrgGRYJwFcmflCRla/KNXhepbKZEqaJpdQiaMT/iabsc8ftwx1IChak3f8GxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601140173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3MyBTYWx0ZWRfX2u1F0UpPD1Ke
 Rpf2iE7vtevjSJJwT5f8waRImmdGJLha7GD4MqlVtnY8FQdpAZfbd9pkeJMBm3C2VYR4dN8WFok
 fKYQE+eS52U8Dis64kwnBhzl1bGrzjf8fqvw6Tzoh0doKa9gfaW2FI3cG7EKV+7R1eh/Pim8o/q
 lysJagkp8BnAgak4SbkZnBQCLNUgor64EYgJapO0AULHeYICN0Natkq77mmCqQiUeZTvF5IRQLc
 IzfolaWa3VAkFkUJoFNHcL/bsmjrPRLmcOe2k9qT2jxCZsdyvO6tLlZwCcjDQVsVRCpYFJDlrex
 dl6GEI73rEQax2g5NdBeWPL28HPAjVKbQeYFEu4dMLbIG3YOkjqKXWAifMMTNBWe/1++whLXtgV
 Ielfv7A1r+mw+xU/aDhg4w1gHkeKYuJ3IXYlYRuSUFI9UXEaG7Yfr8i4s4GX6XeeJkcHevMRHYV
 ThusUZtzD1GolpB+mdg==
X-Proofpoint-GUID: phpLptJ9g9K76EGyyE4X3pr43XXc9EWb
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=6968063e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=wC7XzNwN3FyG2dIMaH8A:9
X-Proofpoint-ORIG-GUID: phpLptJ9g9K76EGyyE4X3pr43XXc9EWb

From: Eugene Loh <eugene.loh@oracle.com>

Non-monetary grouping characters are used to separate groups of digits
in numbers that are not monetary values.  DTrace used to document
support for printf formatting, using a single quote, for such grouping.
Currently, support is largely implemented, but simply not working.

Add a setlocale() call to pick LC_NUMERIC up from environment variables.

Orabug: 30430270
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c                                  |  5 +++-
 test/unittest/printf/tst.grouping-LC_ALL.r    |  5 ++++
 test/unittest/printf/tst.grouping-LC_ALL.sh   | 29 +++++++++++++++++++
 test/unittest/printf/tst.grouping-LC_ALL.x    | 13 +++++++++
 .../unittest/printf/tst.grouping-LC_NUMERIC.r |  5 ++++
 .../printf/tst.grouping-LC_NUMERIC.sh         | 29 +++++++++++++++++++
 .../unittest/printf/tst.grouping-LC_NUMERIC.x | 13 +++++++++
 7 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/printf/tst.grouping-LC_ALL.r
 create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.sh
 create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.x
 create mode 100644 test/unittest/printf/tst.grouping-LC_NUMERIC.r
 create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.sh
 create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.x

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index baa73e9d7..6cd7aeadb 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,6 +9,7 @@
 #include <sys/stat.h>
 #include <sys/wait.h>
 #include <sys/compiler.h>
+#include <locale.h>
 
 #include <dtrace.h>
 #include <stdlib.h>
@@ -924,6 +925,8 @@ main(int argc, char *argv[])
 	pid_t pid;
 	struct dtrace_proc *proc;
 
+	setlocale(LC_NUMERIC, "");
+
 	g_ofp = stdout;
 
 	g_pname = basename(argv[0]);
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.r b/test/unittest/printf/tst.grouping-LC_ALL.r
new file mode 100644
index 000000000..077a0b7f9
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.r
@@ -0,0 +1,5 @@
+123456789
+
+123,456,789
+
+success
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.sh b/test/unittest/printf/tst.grouping-LC_ALL.sh
new file mode 100755
index 000000000..13b953758
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for mylocale in C en_US.UTF-8; do
+	export LC_ALL=$mylocale
+
+	$dtrace $dt_flags -qs /dev/stdin << EOF
+	BEGIN
+	{
+		printf("%'d\n", 123456789);
+		exit(0);
+	}
+EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		locale
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.x b/test/unittest/printf/tst.grouping-LC_ALL.x
new file mode 100755
index 000000000..9993fbcd3
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+if locale -a | grep en_US.utf8 ; then
+	exit 0
+fi
+
+echo install glibc-langpack-en yum package for this test
+exit 2
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.r b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
new file mode 100644
index 000000000..077a0b7f9
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
@@ -0,0 +1,5 @@
+123456789
+
+123,456,789
+
+success
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.sh b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
new file mode 100755
index 000000000..656fd83c1
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for mylocale in C en_US.UTF-8; do
+	export LC_NUMERIC=$mylocale
+
+	$dtrace $dt_flags -qs /dev/stdin << EOF
+	BEGIN
+	{
+		printf("%'d\n", 123456789);
+		exit(0);
+	}
+EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		locale
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.x b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
new file mode 100755
index 000000000..9993fbcd3
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+if locale -a | grep en_US.utf8 ; then
+	exit 0
+fi
+
+echo install glibc-langpack-en yum package for this test
+exit 2
-- 
2.47.3

