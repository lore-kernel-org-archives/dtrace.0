Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DD15CDF1
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742569597; cv=fail; b=HShS2nkWBX4vhKCj+FpVszra+hBO4RIHozrmdarO9rKZ8K1BVDnzNGJ3fLiiBX/Asruizpw5GaON5DHaVmmSW0rj2obeAkdbebMxjXlcG/Xz6EE395sM5D6NM3Svj/BHlN20lqhWAGtELIX8H787rb4+j/6A2Omno4ptJAgOVdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742569597; c=relaxed/simple;
	bh=Gu7oR3LQiIbMtzgfk6kpbaiT3D9lY4iyYitlj2mfYHQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=qviJmuETaSLK4407AI+HxwWXKH+JNfLfUNFw0/Bj9AHe3M7VLoVTdP96tLafg6loYTWH73IE4iJQ7ARHb6elqIpCF8zvTuoG/9z/vTbDLpvDWQvj4lseaaEqjK2q5rumWBqsHDbnP9wlk+ioQo5wV8GcVFMmTtzj8XrDwwIm4rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dL68dTkv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SziXVOAv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dL68dTkv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SziXVOAv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LEBvKD010166
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Gu7oR3LQiIbMtzgfk6
	kpbaiT3D9lY4iyYitlj2mfYHQ=; b=dL68dTkvufdl4Xe1S/aIUjU0RhfQQKoGWa
	i4JP6NEpOKjdQR3PmDcK4VNDVrLtZvSi04bDGr63IVFBlZTahU0enKv3oXx7VFMX
	E0tI/PVMzrGBY1n12lr4svtTt2QWQf2HshJIJ3sAncOXy9sUX5vKjVd+znU4K1Ki
	fklKcV5+yTdNUymmpLtpjnAUx2UrGxfSutj27uEoGsjz4FK0oyDH8MMRNVrf8YnW
	Bm8l41kh608pVyfCrZ3bs1AHbztzom0Zs/yufwSfOUWrfFKz8pHJLExscGz9C7xQ
	fkN17uM8ixjd9IozyV/kk6qWCtl78JsvEU4JkO+azDy/t2P+CzOw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hg8nnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:06:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LF45aS023004
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:06:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxekuc7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:06:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBQASIpIqtBBQwQlBGzDhViQuMFvBCD4M/loiQFvIe39OqVD1QbQHHFTFBEMahB9XoNtsbXmU2kG8s3vPI57A6Hus1nhBaM8Qb7h9AxHPwx7YdwEZWGbM+0Vhgsbdix9BX7CLd7vR1jjiMtojC5nzZbTmpDbzANe3jpNcXCy6WI2szQbDTkYnnICMH6/hv5YmMr3NAhc8hI9tjSUCkbwpv2auhCUOAoQoG1PLIlWhHaimSoF603JWgAZtfyok96tJ5/XUzyEwg7BFnSqarAUgHCUSeBA2sT1jy2loLljlbBxlPc//gdhdRZEcZqQSiEHKEiOzu0zyM6fUQOiLAyxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu7oR3LQiIbMtzgfk6kpbaiT3D9lY4iyYitlj2mfYHQ=;
 b=hZMDDZfnB7nL/pwESOQi5Tr7MpHfM3LAouKfW9zXfHKgv91BF+6oVB0IgQx5aflpeorvAR9T7TZt7cOBWsKv/JCnfRXx/rrCa/blhmE8K/MpI1T+LHKBhOh6S08Wq2DPYVFPkxdncfnfqvKVjQ7D2HmeTeKiXzsTDtyMXmKNp+G6ANYNP1ahw+wFkqC3cSeWlTw7qyY3X5yf/R0CHhnAM93C7seHlrdN6OMxaGw7EEyRXQXFrrUMCOpMOdYiYbO4E2HLvfyrfU8acTmo49UcuFz6tzQvBcG6SXVxDRVDAsTf8xanBpGwliTIh24LhwqPZ4pTlFikPMBKlMVA+k5f7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu7oR3LQiIbMtzgfk6kpbaiT3D9lY4iyYitlj2mfYHQ=;
 b=SziXVOAvjtiGOfLQq28LsN/6xp0BJ7gcqPAXgOFg90EvBydirPtZPPpXNLZYC6aJyPPPgH+SI68Tfg0qA9/ie2kLET0HiIrjXdMYeZYq7RBuy382XmbhvWAJjwGDNKPDaCO6zzq9H54IG/n87Q3URzHtTMLN91Yprs4Y9EPl1vw=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ5PPF972B28679.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ba) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 15:06:30 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:06:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 2/2] consume: avoid a bad prid causing a
 core dump
References: <9aa129d930bfce0b1a060389fc886e9f.kris.van.hees@oracle.com>
Emacs: ... it's not just a way of life, it's a text editor!
Date: Fri, 21 Mar 2025 15:06:28 +0000
In-Reply-To: <9aa129d930bfce0b1a060389fc886e9f.kris.van.hees@oracle.com> (Kris
	Van Hees via DTrace-devel's message of "Fri, 21 Mar 2025 10:43:59
	-0400")
Message-ID: <87iko24e4r.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ5PPF972B28679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d95ebf2-f9d7-4195-f9cc-08dd6889f5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3fl0YDwfhGdOE0YOeyAx7imzWI3OxS8w3c1s6HvzsxGF00RdbR/lCFn5heiR?=
 =?us-ascii?Q?GSChTvSQl+nzuhaIG4trH5h8kkWsZXnr/n70Uu1npmoE+5WmA9KAmMfC7OFM?=
 =?us-ascii?Q?2YUQ1iZL4Ma6s2mCju+Ek3B1ehG7Edg1VPypXRUssuYGtdT4+9ESFvu722cn?=
 =?us-ascii?Q?xHHx+omkTSjYSKpuPj3u9IpuKXcTOXTHrNzjq6yRj6MPMTIwSmW0s5i0FyuN?=
 =?us-ascii?Q?rPCmx7+T2U+EsC/DdB7lcJ/EFixp/03l1peWq9tJKWeM/8pAMXpZgd1lYNUd?=
 =?us-ascii?Q?NlosYkYLeDEEnxQu+2dvv+d3C4JyEfQ181m4klcpfUD5EG3Ej51IfP7EIFpb?=
 =?us-ascii?Q?UsY+IWvgFBzIbM6dzKD146uqanqEl5MazoGVGfSO6EY7wUbkhcE5nHVit0UV?=
 =?us-ascii?Q?X3JJcVmvt6McJWTxbWFav8qu11zwNYRUF78Fs9iBE/nWM0ahbQI2r6h0LYDs?=
 =?us-ascii?Q?3y8GY3Bvoy4milrgLJIyotivFLqmmTJ8fQYb3WROBumhRL4UgZoH7AznvCsQ?=
 =?us-ascii?Q?H1b8Tzha3yviC7+DoyqV6Pn11MzsgvQDJaJPNpd0L0d1aeFSwDa1T0z64DyE?=
 =?us-ascii?Q?nLwIYvuf3MQHVBTWPn7KKbVmA3K7hna9LhD6meCDWVuyW8CR3Vgg3gdBObb5?=
 =?us-ascii?Q?ZXwEDKtw/DuQSI3xTx+iwyZ/y0g3tQQ5+97F2N5e7hs4XOklsGT8ejHYm6zz?=
 =?us-ascii?Q?ORN/QAh9Sf24LTMll3/ynM2mO0Uk2p04/pR5LYtr3OwVaK4535IPalfueTth?=
 =?us-ascii?Q?LWPZR0oMKgaztWf+pmS+zgnaz612gWvs23JRGQL2GIbm7CRG036wTq1uVYhI?=
 =?us-ascii?Q?YQCBDS4wDmexnfXn3Eb0K9p5W/iWv6xTTSnUwsxvfHuC1NBVOeI7v5KvQaaq?=
 =?us-ascii?Q?MCd4W0TuUoxmdd09V8xcncaIQSlj6ZMvvMTkRP0Rx9Z7gKFr1Q8nl+mOkV0V?=
 =?us-ascii?Q?ZASxnO3n/sK6OgENsb1R3+A7rqslsz6rQcWk8pvgvzmUZN5Kl8jszHnEM6lr?=
 =?us-ascii?Q?Y2WCHPxI/JuDIZHlsp8ePS1sk9gFf1v5NBQqaDB3mBCeDFSG0fzoXpfljTv3?=
 =?us-ascii?Q?nbGN8zm57A8QF0ZE7RYwL4Qd09Gra/kEWN564Y0IvbTnqhPeLukhnU5Mhj7/?=
 =?us-ascii?Q?49/lZpVcpRv1u+JHi8KOip+wIWNxVGXQpqSG2tuQZvqmRdrucbgHZmmbi/UX?=
 =?us-ascii?Q?kw5IYauD4bbabn9tAXlpGjoQwy5pRq79HUvXrTFBE4L/CvPPGwEAbyZ0pELq?=
 =?us-ascii?Q?lbcB+TlkU7dj/F7dSL1zmRwOIgWwPf8Q0rbyPP6X8KqaWXWS4bcNe9GKc4y3?=
 =?us-ascii?Q?AmRwZv91eYIa7zlQx48cXqliyLjA7WhlERPoWattuDfUUtkdk9W4W3+4eKhu?=
 =?us-ascii?Q?oO+x/IMUyhyp74DnQRnBHHaV/NOV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oz/fG/Jzssi1CAD9ueSMM13ZRbV0W7pllVv5AvLLS3DZiDkM1kra1L7CeiWF?=
 =?us-ascii?Q?jE3VTr2S2uqIUsIkEsTgJRXi1oHZWlYc+DdhgcxIyaW++KzzczJKOVNIe1u/?=
 =?us-ascii?Q?7DCmsrdQA/PATV5lALyxwuke/8wpYjZtQDzprfWI604wwZcPMJtZjj7a6q5p?=
 =?us-ascii?Q?s+CzITDggSAIXcbqsimgABb9f63sulUvezZQxv28JkEVh/mETXD+hRvUENUP?=
 =?us-ascii?Q?bRWLzNd71BPuWRwiOQuOYT/w15DH+QQngi+TBKRk1Scvg/cGjFki3mOKSbZt?=
 =?us-ascii?Q?KqKp2MFPldFjMJZHk9IzDbMIeJtSFX13ID0nkxKy3ibfDrDJVxKk2TOoG4pO?=
 =?us-ascii?Q?EhDuwz6499Yde/4sA1L1y82c8x6oGBsiMOfH6A0Zdx5OsjPDP+0wKpWe357y?=
 =?us-ascii?Q?w4ZUKgbwfWZd2YBiIwJlhiTRW8Tw6OIMg/gbSJoseiGel5Spg/Cm5/cV6p2f?=
 =?us-ascii?Q?hDfD3QsY+XrsgqzZTyaM2m4Vth4nSL4n8Ev5n0Hx1E8NEE6wWLcaQOrVOBHn?=
 =?us-ascii?Q?ACaqAWLYPAJB7d7RuUwW/dBT100bWmezlsr0Dyy1TK/t7fSkpKB6vUdfeP+i?=
 =?us-ascii?Q?Lk+HwPRU2u1WSzPNw4lHENwNCMP5y95XOcq1fcdUaHUiWjTtHgYXmUrDWrRi?=
 =?us-ascii?Q?hmsFTcphXkfkvXzWTr1oYjCcxQ+pcWEHJkOJeXwsWMpwWRjwfez8zO18YJz5?=
 =?us-ascii?Q?sg4gWwNsuYxZluP3GD6NES4ndsbC5mDvp+wEXEm5yoAl1lh0kpT1Uro1waN5?=
 =?us-ascii?Q?Ixfm6dLJQSZeM1OhOWHzIjxQozIRSNKikNuTVRhagAmYPqSJEdDwYQtnBKz7?=
 =?us-ascii?Q?36F9F+/XVwYS1Vx13iO4l+GFxTmCDC5FFdcpEvo+e88c4imF0Is6RVVx+i1v?=
 =?us-ascii?Q?Vi/0873Vq5mAroKkQMsoL/fs/GduS3qkWty2gGWbC7mnXXDgeqvbxXVPvD15?=
 =?us-ascii?Q?nPgl+ECONURJN64MqhnzL5lJi62sY7WKwGlUOqYsbM+zoVlbu0L9pJYuFGYU?=
 =?us-ascii?Q?tBKTQvNL1p4kpUz5fOHFwZb37DafpZF8WGuNeTICc7JjEtrAk69FgAtkJK8E?=
 =?us-ascii?Q?wSZnfHgtIQkE8QIaSxmig5fl4t5wra1AM2Mdb9YnSR3ZOuLlS8ZtzZaYJoDV?=
 =?us-ascii?Q?qfTY/4HkjtEzJxQyyBopkDVY5SFtXCN9+tWRju5UldmiNsK3F0yuJ5U8qL70?=
 =?us-ascii?Q?msOva37bWNnZcwtOiMd6bM0eliYia7/OB8O3K7M+hBnFR1qWIB42zyqPwNTj?=
 =?us-ascii?Q?VUddudtRpIIBFUeY9c5OwyAiRYsKpei81HCOWSVLmVPq58SsYCEV9IpjjUYc?=
 =?us-ascii?Q?pUCfeCZGw9VNQBRcuwrL8hQlap7nH8sPi2h+sk407BN61FnguGQ/D4+dlafS?=
 =?us-ascii?Q?wOgBuYmjdsCntedmJpfnz0vvlw8+xyda5crjSZeotYqmhlZq3QLVgcaXaVDQ?=
 =?us-ascii?Q?GLL7NjjSvmeWHE1dW4brel/mynad/kYRYdCZ9lNlPWg6esAqJ1vJlNOFjD8q?=
 =?us-ascii?Q?ogESaBI/0CV/0cCXKozC7l/+yWUtRAr8EI4xWmsCbxqJRBAxgXd0uA7CNjXG?=
 =?us-ascii?Q?ljyqV2eKc/eVFisvodqlQW2w35GoRubCF6u6p31OEdqSVuHpsdwCX/IJEOfN?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jQzctgEjFstdsCnKz5YNItgOBwopZf1wt/wSM7P8xxxQvNtkhTW1Mg2t0Ek3a/E99GPpDQdFnJGOZxL8V2T75lZiCCEufk9c7wf2bNP2X+3YOg99grCC527HluLzJopEqb6xnGORRBLUmtEwkwPwGPoZtufnGqkVkC0+mMfSQ7CCkVjS89k5J6QXBzq/+OsyUmUVJAdEzUy38tFLwqMY28t0vUURuHzDZdHEDINJBZxOZt5WFeAKe45a4pfRYGI9VYwaObA7PBYBNULKFnpCSYXPKQWcUtt4KbOPkur77g0QpE+WSJlnY0H6lkJ3cHkdMBoU71O1nEtpbm/W3YB0MTTEz18xGhpy61PagaY5irdYE0Nm3wdXBRO1nAoXFghqpiBpPYht8LrAWDhRxQ9TVjLUD0kvurmvKfUUmKpcsUqsDpvtQXZepYArZ2ZYNTn04ojCKEfqSqdionRYKLzjDGxRPCL8U4a6v7idJhuA+1WNxvWvXA78mdpHacBQAhPzMfgRxc3HWlmsFEB+m6x/7rJXdw6V1KaNpRrPOx4SHKPtuIK6vVSAe5U+lH2KU9Zik9K+TUlEcGvMk/lqLRx16eclhiNZUabcopSUIXaRKsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d95ebf2-f9d7-4195-f9cc-08dd6889f5f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:06:30.4266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqW6hwWv6yy0o8uP6JAMaw9kLeE8BMBVEyLPr3TYhqk0ykiFfLxHKB2CS/RbU0jXKH0GXxf9lyMpaWL8XC5h5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF972B28679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503210110
X-Proofpoint-GUID: 4I24z0hnww_zOJkPkL_b9RqUQz4HQWPu
X-Proofpoint-ORIG-GUID: 4I24z0hnww_zOJkPkL_b9RqUQz4HQWPu

On 21 Mar 2025, Kris Van Hees via DTrace-devel said:

> We were not guarding against prid being DTACE_IDNONE (0), which would
> cause a core dump if it was encountered in a trace record.

... hm, I had no idea that the dt_probes array was 1-based, but I guess
given that the NONE id is 0 it kind of has to be.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
