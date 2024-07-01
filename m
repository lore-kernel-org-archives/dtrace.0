Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F81649BF
	for <dtrace@lists.linux.dev>; Mon,  1 Jul 2024 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719856070; cv=fail; b=WrvusRF3qnHhP8kesv401/zuMRWi5KWWEBJrerd/sk9VxW9/J3d9OMjR9mX35Pov2oiHl6n6vdGsPCAxgFxVkp6Kvy4g6UeiXn/Rd+vqt8LvjJ+YJBWCtP1NxhdAFqovcuBMUMtNuJ2s4xjl/lO85A5NeyRKXAxBxnnzUhZ2k2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719856070; c=relaxed/simple;
	bh=AyYzqaz7amHebLtnfusMc+9IUwdzhtQWmov8SgU729M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GTK4XlZn2dnZjjNiuVciiqe16KFFtMHi7w+LjmeYiLoe6Y6ODvch3haPK4W+fyTMV3qFXr5R5oBzJMjOpBNKaKhNaMLPpK8uOI0gskAr8ex2MmydMON4heebDF4ShzLQ3sn2CGQXQLrgBatvkQkxmRt3TaQW11P0LeFuAo0js3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FEFyG7z5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tTb9cRcp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FEFyG7z5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tTb9cRcp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461FosIg002068
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 17:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=6LvSF1Drchhf/Oc
	bOIfiaSmWnIhsqwrWs0oLWeWj/+w=; b=FEFyG7z5cMuPiUM8wzN4W6M4HBFU+XE
	B9BUai5+IUnw4D2bPoG5KA5r+XPgt8JrpxnyaejvOzusxSapNbVbj3pdL5ec+q7t
	5PokvtaXFefHpno77S2SIueuulv6FAMOBwNCsh5621YvfsUPVr3pvvrSm1zc9Klh
	BOrP7fttKy87Wa/g45lnh0cT5UEE7s1MF7PeUzskW35Hql+U9rUCHbjMMmvSOHnM
	rdNJKgrAZSNmkavIpVr99mo4ApNNHgYNGxApFJbMCV31QIwzyUWgVuVCysCeyPiK
	IIFsq/rV1s5RKsGbJ8lECzEeHJIY9TItqyUASOCYcLNvGUHfaFcYwyg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4028v0m9q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 17:47:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 461GRM1u022872
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 17:47:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4028q6k3fc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 17:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWgY91NNQPgCO7wADJhc/mz4K8y2UVO23ElcuV96FLs2IYDQ0rUEusS/WIYZ8rTsG80rIaqnVkFUQB9Tw/4xWldeHAbi9cIwlZ7HHISNG6FzshuUQHk34AqO/I/Gxsy+kkDHwRBRxq/tRNU6BHIjUyHT54G7LwPXbjYF6pVofpUhX9c3hAwOvv4x5OhjVk9h4MV9bG6LhcSFncOP92KXBhJyERPUXzvs/2R+TuGr13+zy1GykIeZZisCrV3bGhJ2mipjsIoN9o594o/yjgEXZsomgTpP0MAnTo7GKXNs4ol4lHTN13jv1UgYJzLp+IBlvIGrxu58Kx+myCZ3oaOWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LvSF1Drchhf/OcbOIfiaSmWnIhsqwrWs0oLWeWj/+w=;
 b=mgZvlas/foY49buRXcOQVNXMtM/Bhy1E6eauN5fw1dwSPWfT8GaQoCviAakp+8KAxTYBGrWeYwJ78Nmg6H6bJWZRVidFi59fbHocuiDzBk4yvCpxJhbhed9rbpNTaAdJ36iQvZU/YMsUJe3Rj78IQTJGquxUiNlhK/DCcBDE+DrJ7YAJP5Aunndds5EWed2lEMxSrqPUD27bGJlfFVXOaF2FpSPh7HxjiWgjn597Mvpz7HWHdEDi8wZ7KUNGVvJzWJToUyaXb0rXUcQzmXr1spdaRLkKPg9a1QBNNi42h5r6GzTYtfgWPwllJJCvFtlUGiF8X7EXdrUoU5+Rhgyezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LvSF1Drchhf/OcbOIfiaSmWnIhsqwrWs0oLWeWj/+w=;
 b=tTb9cRcpQFdkKHb+c15h0/M1dyl385kL06m8FSC953ia12lzpEo2Vfr3gUSA8pwzLGPDNtL7rPW8ZWQXxg4kB0pX51aSKJ5d+UZfZD0iYF+q/+jTCWbHq+7tRLh0hZ2p/teO06tatO4G3dshLmkGQHrXLhID6tX15GoQ3wqQQwM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7475.namprd10.prod.outlook.com (2603:10b6:8:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 17:47:38 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Mon, 1 Jul 2024
 17:47:38 +0000
Date: Mon, 1 Jul 2024 13:47:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
Message-ID: <ZoLrt+Q/DWf6K9q4@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
 <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
X-ClientProxiedBy: MN2PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:c0::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c4317f-492f-4ae2-0dea-08dc99f5e5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7H7SXSW376WMVpOyTcLRIl+BX3t8Gb9l+AlmOSZIt17DzgeHHpvei9t/tkkh?=
 =?us-ascii?Q?kUpg7f1qln7QGED/KlvF5+dzow7UST0hKLyaOsBZ2+lrZbWEGzTfUvkyhFGU?=
 =?us-ascii?Q?NCpwnPiKicO77ci3GT17f3Ll8eQOwhHhe4en9fRovvq3QZTSfXZF65LH6+JO?=
 =?us-ascii?Q?BlEpd8vzTfVSqL9zBttOyq4lsbVQRwKkrggYQsLK+71E0FYG7pvd5Uua5shV?=
 =?us-ascii?Q?1XehNSafS8ynNqo3Hy2O4ntEupjo4WiedF+QWXLaapPZ/Q0Tepld6WqD4YIv?=
 =?us-ascii?Q?EuCvFGkhg6CF1UsLzWcmow4hv1QfFfsp0KhzAgnBpPymDiiTdRfEGjtARTDH?=
 =?us-ascii?Q?21NJAeVneRH8+SKMUWRO/FLgyzJQwMeAq0gDcNRHJpSw/Bl96DJt8Szm3Bcr?=
 =?us-ascii?Q?FBZdB/sumk/lG7QgOtp2E4X1meI3qk6cj5A1O7HnxnsnQaUsx404jmVrMzfV?=
 =?us-ascii?Q?Hkcn5lUZhPLPN6fgQ5HZLOyl7XvvCdc4obOZS4Acx1ZXhZV6vsT7MZpFcz5m?=
 =?us-ascii?Q?QmpJnQDdBWfoVhZNBPeX3sgg0mc/u0aB0vKIbK1XO6+nM7gSIgKTxIqWIyw5?=
 =?us-ascii?Q?/OF4p5hwXRiAbP9uulO6GeF6OOvrQT7BYsYbmnzarSsiN3EdG3fKj6xpbOgH?=
 =?us-ascii?Q?1IY7UsCavaqNJEcGr34Ou6RGx81MihDRkCzdgXc9WeCHPuI4Z1dJJLDxks4T?=
 =?us-ascii?Q?hRXVI2tkg4kvRa/imnOoAN50RoPaMyqRg4JhDXRWaHbYK3WlF7mNXK8xjTz/?=
 =?us-ascii?Q?BXxF+C9dvM51QDjnaxyhDmMOno26NAXBJW4REZCTvNgUdypjjgnHGMO0kTbZ?=
 =?us-ascii?Q?ItHaFFfdDk2sAoTjwZBsxKfkL7owWongKVGxXD3tzjEyqqegRQbeTQ1L5Aqu?=
 =?us-ascii?Q?r0L63Bl5QaChuGEOrwMNym5h/Wx5/XHosYl/o65cDlB0NqjoMjNmI6S+PN1c?=
 =?us-ascii?Q?UsAK8mLla2zbMegxYIO2oca3laz9ws++qnFV/4NfEgG66bQMRv4+uN0Nuz/e?=
 =?us-ascii?Q?vKB1WdT320E3VvbCY4Htodoa8ztR43Emmt0IP6wdsaooKqsbt71GGbYYoJg5?=
 =?us-ascii?Q?0aB26nQTthVCgvkh/wXGFO9Bzc1cbPHmfuDZP7ADhDtg6mPVt8UbdI7Rqudn?=
 =?us-ascii?Q?Z4FjQiqxhaKRiAvYL3e8wq4qA/irRRIzE5xzlRcphJVmdtsAYCExbu2GXWgT?=
 =?us-ascii?Q?cizM/0CISilp027b0FG1fnl3VlubQGGaeEEybzrhj3Whr7ZFDltSDBYmoZ+n?=
 =?us-ascii?Q?Nd4E0FounMawnQf5TKY+e9mxQ7VRZt0UqAzsTfP3KenyZL3GbD4urcI5t2OE?=
 =?us-ascii?Q?eZrKT9estDBlJmqrv54WqswgoiSphiocuLSESMm18Od2Hg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UKQBDBmrzX6ADWepLGrXlDwogeBpDwNlUS7rLeUBBamIotOR+oEH9vepNYYe?=
 =?us-ascii?Q?rp5hJtExseFbvkPKlQ60qSTmqlz14nTF9hwXkKv3LjuI0PUDTonAeRZ89UTT?=
 =?us-ascii?Q?Wm0PiovytvzSrK+s6afb2kj2/ZhWROucMSmdVdphzBjX0SWwh1DJXT9UH1lO?=
 =?us-ascii?Q?xwKC1UaG7oYunGNQ193+IqReAWDxSZv6nfILQAMmsl1xHTacIjF9sR0frNFK?=
 =?us-ascii?Q?KAb/UhXN4P5IqpfYuURvmVMBr59PMSWRKrofFCrRrXX7ovaZ5PsgzJWzm+9X?=
 =?us-ascii?Q?GKksQ7IgXYHhD5g1PpUp+l6VKsKz3ogy9wWfAkZrz8T2Y1p/4pwYI3DooIHj?=
 =?us-ascii?Q?DcQgPG0zkfEk5nNFyHJcQXPV3A5I+AePtZA9URV+WkuH4FpuWlM2YxrNUtaP?=
 =?us-ascii?Q?u0vixh8wq9bgym2cz1Zrh3uOKvuqV+LQoB4eAD9LVoGHC24WHH5eBUp0cjvA?=
 =?us-ascii?Q?kV6rOFl8ybS5NSHS3pRSqJiLZy+yiiQhDRqEbxM46ibPrCGdeCPIgO49U04J?=
 =?us-ascii?Q?C2MYxNvvUxm4pxs1tcBtypDpRVIssGX165NXVfZ7Na71KfC0ovLxMxjsZikZ?=
 =?us-ascii?Q?fhAzkwIRog8LorvVNgtMXgKi6IZVOl7UZskYA+oCVk9cWvuqupMdUBSbkL+e?=
 =?us-ascii?Q?Fx1f+shObDKpvZkNensvweOq4t1OwRSsAcOuSkTv3kCyU6jM/10PNdMIVcKV?=
 =?us-ascii?Q?+3waed8dy616aAfHuoCRHSZxse0o5w1p8zqTbdchP5bjaw/DUi8GaiFRzMKY?=
 =?us-ascii?Q?/uZdX6vBDWH5WNbDeYYWAgIMLoXWv+uSzYFduJxFQUqnN1Kb1q8V8X0DLSW3?=
 =?us-ascii?Q?ckiwAMQL+GBgsArf0s19rfpryUX7oQrRcMnrrHv02rQZxNGmGtZJukMS+EXr?=
 =?us-ascii?Q?Q1K81kT42ctfY43M+0MtvyiytXb89GZG/VnqQALpy+aOF3MpPAW1rE+Spo2X?=
 =?us-ascii?Q?+iXhmmfOqCZDRH7m0Aoh0yzpN9RomXrNhhYHjcbTBGPsUqAznVg20JoEH94J?=
 =?us-ascii?Q?kIFTNceLCF/lDmKJT3K1F2YP8ejnbscC2qJI8t+YD9KQXFN2MNnewTxQ+mJN?=
 =?us-ascii?Q?sUobNh7EibWEWR0R+/kZ5A6hUJww8dHfYV/kFrFWMYZ8FD+Zi0iLezyQ4l5U?=
 =?us-ascii?Q?HRXy4y7mInxOqB9EBECUHuNatn9aEjwZQCILZ53lMwRL3qM0NWsFFYEe+336?=
 =?us-ascii?Q?sYreq2icCZ7HyxO5LNls+DNn36CbFtlYSKqrCkj2rqmlUp4zDw5EjsV/FZET?=
 =?us-ascii?Q?I49JN9QFdMzq7hEHNK8e2bKWOj9EeqfwOPg5wd6PRjdEJOzce0pr6qpK7fpV?=
 =?us-ascii?Q?crbwwOuuObjWVqECXZSRg7D30V/kDs6gGL0kRcgOlZ+Wszp8fzhC3WQ6Cal3?=
 =?us-ascii?Q?J71NmTGUsKHfWE5F/hAmni1ZiJZhXOVhndLTpVnKLhFmAa7l0YJoPM1xjg08?=
 =?us-ascii?Q?6NYQPfXjT21B0mgnbnvQFYrD6i4DwCqxFE5UNyLD8UjjWK9eKJtb1fGZTDFq?=
 =?us-ascii?Q?Sewo/NzNuDZaXCbBFH8DZUlRtEHhYdy0mnuDsFDrgzdCBBcLFWQO3YSfZvF8?=
 =?us-ascii?Q?eQfhRo9MzeTyJo3dt8/EdO+jO/VoYwSz39x+smTpC9Y/XGycjhQanBXGA7aC?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AT6w3kkkiyVBHzH2+BwtIfWaE+vAE66N8T8SJMY1FZ+rAEj5jfBH4pDN9rrFxeozI3VyYUV4WO2FZRrjeBSwl5nl6Uy2GC3U5Hez85AXJoHYi9tcG7E50jYem9xDkWfEIxHhBwiX0hw7L2xoZ8FOGW4532L3MB86DIaDlxHLC2W339Fn9oWU8L3IUSkksu4JvrKfBwFfh3NGpm378RYUwFoU8Zg7sD6W94e/IQ112YWgLaKp+P632JBGsJjdxG6ke/Z6DLDB5RnCPU7j2dyIJy1scM5QQ5UbFzpwUnuiqPsQvd2QGLU8xfwGXt2NTlEoqUj5k/pgm2tbxMsb4SOjhvg87fQptcVquYkwytyAc88dK8ekZNVzknWMqRmYWkQFaeaL3LsqV5ppt1lYx96X1Kxxrimcy2r80Z6M2eWM+WFLJKvt/w0t/UlI1X4aw6huXB0VhvpqDfWiPyztyYSH5ZkAm5Gw6wo5s5I/Araa/fYt7U6s9iZ7aHbZxE+t6gM1mUWYfT14TDs+bQf8u05ZrRUBUoCs6lHgWLcDmUX6sLCf9/YsRRWlckMJ2ABzcAAR3O1viFlQkYGgF1oAWeStwDLlMmoP+V+wrY9qJDjy25w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c4317f-492f-4ae2-0dea-08dc99f5e5da
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 17:47:38.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GF5Fm7/MXmEaQgrDZFueLJl5cONMmChZk6x4J+3VG0VBbRnmVpQceoG72npBvf7RzGB9u6kGx6E1LL6mBTLgsvWZMIXty3z1K+tKfWLl30M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_17,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010134
X-Proofpoint-ORIG-GUID: v__0bvtBIymJTCUd3MgvGGY3bdjfZb7K
X-Proofpoint-GUID: v__0bvtBIymJTCUd3MgvGGY3bdjfZb7K

On Mon, Jul 01, 2024 at 06:21:19PM +0100, Alan Maguire wrote:
> On 01/07/2024 17:50, Kris Van Hees wrote:
> > On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
> >> On 28/06/2024 22:55, Kris Van Hees wrote:
> >>> Looking at this again, I am wondering why we don't just add type info to the
> >>> data record?  Since we know the type of the data items being added to trace
> >>> records (and type is expressed as ctfp and type id), we might as well store
> >>> that in the record.  And that would make this entire situation pretty much a
> >>> non-issue because the record would already comtain all that we need to know
> >>> to consume it and print it.  No need to pass a module id.
> >>>  in 
> >>> If the issue is that modules could get unloaded and thereby some pointers
> >>> might become invalid, then perhaps the solution would be to always copy the
> >>
> >> Yeah, I think (as well as modules going away) the other worry is record
> >> corruption, so dealing in direct pointers is too risky I think.
> >>
> >>> type to the D dict (I think that is the right one - I always mix C and D).
> >>> And since that one is always around, there would be no need to associate an
> >>> id with the module and pass that.
> >>>
> >>> Perhaps doing such a copy is the best action here?  And we may need to look
> >>> at other cases where typed data from modules might be stored, and if there are
> >>> any others, they may also be subject to possible issues when modules are
> >>> unloaded and in that case would require a similar type copying action?
> >>>
> >>
> >> I looked to see if there any CTF APIs to simplify recursive type
> >> copying, and  I couldn't find any and that's my worry - this sort of
> >> copying could get complicated fast. The other issue is size - a lot of
> >> the kernel types will pull in a massive number of dependenent types
> >> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
> >> all of that in the D dict would be expensive I suspect. The other danger
> >> is introducing multiple types of the same name into the D dict might
> >> complicate things for other consumers of it.
> > 
> > I mistakenly thought that we already included code in DTrace that performs
> > type copying, but I cannot find it so perhaps I was mistaken (or it is more
> > obscure).
> > 
> > But then something else occured to me...
> > 
> > This is all compile-type-known data.  In other words, none of this is passed
> > in the actual trace buffer.  That means that we have a lot less worries about
> > how to store this information.  So, look below at your patch and some comments
> > that I think make it even easier.
> > 
> 
> Thanks; more below..
> 
> >> The worst case scenario in the current patch series - that the module
> >> goes away - means we can't print the type info, but that's not the end
> >> of the world really. Certainly in the kernel case most modules tend to
> >> stay loaded.
> >>
> >>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
> >>>> when generating code for print() action we need to identify source
> >>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
> >>>> Introduce a module id scheme where the module id can be stored
> >>>> at cg time for later retrieval at print time; this allows us
> >>>> to later look up the module and its associated CTF without relying
> >>>> on possibly freed pointers.
> >>>>
> >>>> Under the hood, the id scheme uses a monotonic counter coupled
> >>>> with the hash of the modules name; the latter allows us to quickly
> >>>> look up the right bucket via dt_htab_find_hval().
> >>>>
> >>>> This fixes an issue encountered when using a shared kernel type
> >>>> with alloca()ed memory; DTrace assumed the type was in ddefs
> >>>> and it wasn't so it wasn't displayed.  This change fixes that and
> >>>> all tests continue to pass.  Also tested that it works with
> >>>> kernel module-defined types now:
> >>>>
> >>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> >>>> CPU     ID                    FUNCTION:NAME
> >>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
> >>>>                                             (struct ieee80211_hw) {
> >>>>                                              .conf = (struct ieee80211_conf) {
> >>>>                                               .listen_interval = (u16)10,
> >>>>                                               .long_frame_max_tx_count = (u8)4,
> >>>>                                               .short_frame_max_tx_count = (u8)7,
> >>>>                                              },
> >>>>
> >>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >>>> ---
> >>>>  libdtrace/dt_cg.c      |  7 ++++++-
> >>>>  libdtrace/dt_consume.c |  7 +++++--
> >>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
> >>>>  libdtrace/dt_htab.h    |  2 ++
> >>>>  libdtrace/dt_impl.h    |  1 +
> >>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
> >>>>  libdtrace/dt_module.h  |  1 +
> >>>>  libdtrace/dt_printf.c  | 12 +++++++++---
> >>>>  libdtrace/dt_printf.h  |  2 +-
> >>>>  9 files changed, 72 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >>>> index 27246a40..30cccdaf 100644
> >>>> --- a/libdtrace/dt_cg.c
> >>>> +++ b/libdtrace/dt_cg.c
> >>>> @@ -20,6 +20,7 @@
> >>>>  #include <dt_dctx.h>
> >>>>  #include <dt_cg.h>
> >>>>  #include <dt_grammar.h>
> >>>> +#include <dt_module.h>
> >>>>  #include <dt_parser.h>
> >>>>  #include <dt_printf.h>
> >>>>  #include <dt_provider.h>
> >>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>  	ctf_id_t	type = addr->dn_type;
> >>>>  	char		n[DT_TYPE_NAMELEN];
> >>>>  	size_t		size;
> >>>> +	dt_module_t	*dmp;
> >>>>  
> >>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
> >>>>  	type = ctf_type_reference(fp, type);
> >>>>  	if (type == CTF_ERR)
> >>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> >>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
> >>>>  			ctf_type_name(fp, type, n, sizeof(n)));
> >>>>  
> >>>> -	/* reserve space for addr/type, data/size */
> >>>> +	/* reserve space for addr/type, module identification, data/size */
> >>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>  			      sizeof(uint64_t), 8, NULL, type);
> >>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
> >>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>  			      size, 8, NULL, size);
> > 
> > Here you add a data item in the trace buffer that will actually not store
> > anything at all.  That got me thinking...  And then you store the data size
> > both as the specified size of the data item *and* as extra argument.  That use
> > of the extra argument is unnecessary since the size is already being added
> > to the record as dtrd_size (which gets its value from the 4th arg to
> > dt_rec_add().  That means we can use the dtrd_arg for something else.
> > 
> > So...  how about you do the following:
> > 
> > 	/* reserve space for addr and data (modname and type as extra arg) */
> > 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> > 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
> 
> Maybe I'm misunderstanding here but isn't there a concern if dmp goes
> away before we collect trace data this string will no longer be valid? I
> _think_ if we were to store the module name we'd need to store the
> string itself in the trace record. The module id approach was an attempt
> to remove the need to store and retrieve full strings while not exposing
> us to the potential risk of invalid pointer dereference. Sounds like the
> trace record storage implementation was inefficient but that was the
> intent at least.

Easy... replace
	(uint64_t)dmp->dm_name
above with
	(uint64_t)strdup(dmp->dm_name)

> > 	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> > 			      size, 8, NULL, type);
> > 
> > And then the consume code can perform a module lookup by name based on the arg
> > that is attached to the 1st record, and get the type from the arg that is
> > attached to the 2nd record.
> > 
> > This also avoids the complication of modules possibly getting unloaded (even if
> > that is quite rare) because that will mean that the module cannot be found and
> > we can therefore take appropriate action (unknown type so just dump raw data
> > or something like that).
> > 
> 
> See above; my concern is recording the module name via string could
> result in ending up with invalid data in the case of a module unload.
> 
> Alan
