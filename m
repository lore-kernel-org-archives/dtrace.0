Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F342AA3
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851387; cv=fail; b=V1zoR3itRC6WNpXayPe8XXE/bzKRCsYgQoG4Uz8ziaGICedgXlUOf9yGKhWTC7zQ/WKeXLaWUqR+1+/ePACS86Z+k3nQTaex7GaKv2Baah8MaVfxuruzjrPsNNRzBTT/+Xz1usSU27lhkxoi4uizrJZEaNylcPxoxVEu4jwCRZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851387; c=relaxed/simple;
	bh=7I4Iyv3+CgW4MA4rJqSMwavbVa1jrohRw+v5nJjQBJY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=MDC+CIwcoRuQ06WyV1/vXvcnN5btJJQa5eOtmqZnySx1N+xFNE41+hkRcVptebkBxpPY2tEvP/7GFp2/FxbdhkW51KlXJUasPhDycHM8hUox6faojpcdH4yGgYmGWz6raBN4udKldo5H3+tNBXULuiWWiUfZcHB5UtCHZeCwDD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RavbFl3z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zGm5IneI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RavbFl3z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zGm5IneI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597FZBvj032025
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hoa2h7TvlctBNX3PhS
	BZ6BXle6O17GWT+RkCyP8Y5XM=; b=RavbFl3zzyH00Xedf0rVpo4wKnNSIcOh/c
	exzqP1XmrNG4o6se5PEBhV90ki8tk7eyDCu6db2lgcp2wxmP2shjGrnpD3K3AM+/
	fWoEZkU2mkvUzMLGUvkuY72MCUbT6x0Out5HcABxdClmSYSKpvSSwgCLqeDnbOqR
	KRjIZManuiBSYQQL0E46V6xid9ouQYgGlSwHwZ3lF7BbtLjdV3jk2rPCmDjFtvSc
	TFmk35P/ii/54zDyksMpjDGdUqem/Xrz+Ylx/mCJdS92ZCDdUStLGKUV6X//iFB6
	AtJ04L2GZB9i2K+j8mSRLORSY29mI4TNvwZW6YxMrBf/aqRheScw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n5md002p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:36:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597EYNSS004220
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:36:23 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18kyk2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBWyktpNA6bLow5aqn4porINiilg7Kj/2iMzGGbeSfwopE9waIz7UUpGU5qZpnk19+txGEBuAUWMOLKLm6QNRO9WFmOVhFc4J69jt360llpJWTJef2EfEm6Uq21n3ltugE+WkZgxD5Gp9TrCb4o+Vbf91bfwOfyE4k7rak0Ggfc0atrzscdCs/TUaEHWxXi/gcO9Dbx5BpkbDAvSwfs/SsnL4f4NfAeJAMGEdALf5axiH8VuKhBMtAPcyZIPfIjd9DD+0lenAKHtKJiZYMpUeXwwcUwy/5q7J0oDuONBWNakJR7l2RNeI5G5IAvRgKzcNk8vVRL0wLkt5/sRBGMhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoa2h7TvlctBNX3PhSBZ6BXle6O17GWT+RkCyP8Y5XM=;
 b=almzUk7DTf0uG6/nr/MkAIvfHbbbTqjEAF4RXzerIfYuCxxp9sZiVrJarecoj44hjmMJN3K6/9DvPYuUasm1di71qOUkfWXG/1hkWyUBNcBkZi7gOY0VeA0v8IRHG7x1J2KJcHaIaZ69h0Cz0iZTRvRHMa1IuiIi+lLeZUUP8iy6aS+HSxukPp/hP2q0V2v+qIwEuRX7fQkg5vqN97CNDGI/l2lnvbbp/7E53+DVLLc4vpGpc1hlaEXgG28JAlePiTRveH4tjblOy7CFW8JqpqpH3/SWYcGGnH1eABqyraaMb+3eH0CazKhY+Lq47Cr/8+oHjUh5ncxOS0/WSJDStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoa2h7TvlctBNX3PhSBZ6BXle6O17GWT+RkCyP8Y5XM=;
 b=zGm5IneIhW5BrvSuVBKgNcBZtZYn4CfHP453+fCBmNQd5dr7O1dmxqNlEmD3JqG7hh+9oIyAdpB4Q1MVrSOxNCjpTWWoNI0I2gvj09e2UpAWTNv51bnG1nisN8rg+deSWrkLzn774KPxNnTfY9QfrM0NZlMRGeDp8xbwddcNCxk=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH0PR10MB5642.namprd10.prod.outlook.com
 (2603:10b6:510:f9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 15:36:17 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Tue, 7 Oct 2025
 15:36:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 1/5] test: fbt return0: work on quiet systems
References: <20251006152829.239100-1-nick.alcock@oracle.com>
	<aOPpuSFUk1GWVokj@oracle.com>
Emacs: there's a reason it comes with a built-in psychotherapist.
Date: Tue, 07 Oct 2025 16:36:13 +0100
In-Reply-To: <aOPpuSFUk1GWVokj@oracle.com> (Kris Van Hees's message of "Mon, 6
	Oct 2025 12:09:29 -0400")
Message-ID: <87v7kq4tci.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::21) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH0PR10MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: da336628-ed9e-4e73-29ba-08de05b74199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kKVtKQPfhb0Q/iO97AdBvIJkZcMiQ6BVRlDsi29M3qb/xDq+jfurLxid2war?=
 =?us-ascii?Q?FZzuMWNKoF7JWkJLyxQriprTnQiT1u57yyjKArlU4YVe0CBoBw3aeac8cy3v?=
 =?us-ascii?Q?RyBlESuZ5vY2pZQ7a+upWCpAKLx/sNuamraTy9i+rZ6xWbfgbUkraGo3dzap?=
 =?us-ascii?Q?47x/3S7X+vljVRZKR/hjI7ZSfIAU4yfqdCarcHpt/JBEUsJdytVRCJYOn8Dz?=
 =?us-ascii?Q?QlqxgcwzOBtrDhAtP3FZ2iGHZVYQukuOrBySgBPKQ15xDtXI/kE0Rw/m533X?=
 =?us-ascii?Q?49D+e/rVUoSXG+4W8S4SLWazQEED7zwpl/yw+pGh/Kg194OBzptDy9d9aGte?=
 =?us-ascii?Q?toWpjD1UHnyfV3mrFHotMVqvaPwfak4PlbgBZSuZR38zGtfhS/T9iUykIzmF?=
 =?us-ascii?Q?5IyP7mczK8vBpWirDbRjlJbZKjY+MWL1khJuZS0dCb5dk3Eq3uC6LIf04WG3?=
 =?us-ascii?Q?jGjTEuPf4jZFyQIO4X3EALgWMBQsl6+c1Qc/OFaC2yQR9eOQtbwVVvigpsHK?=
 =?us-ascii?Q?vsXd8oVJZqhvVvl8Kuzh7eSuodkvp7s7iNyN03m3nLHZh6LQno7leBfRwCdy?=
 =?us-ascii?Q?e6UloE0sWpeNZXUviGUxGTRlLSsCBQQsK32E+R/oJpRJJr7VEfVztQY8JljP?=
 =?us-ascii?Q?d2Dl7w4UJgET5hxLVvN7utyONp//NaZ2En1qTPjvNa9ZTcXbBMs7ZGJ3GO71?=
 =?us-ascii?Q?FjN2DtuPosclkdcfurBFuHguKSirH1XirWOK0ckeWWP4YNtfcA45gy0S0eHi?=
 =?us-ascii?Q?qMz7vqN/4X8JEwtBSuVcS9sRwfmWLIw1sqMbsY79X7VIlDCXWgwe8LjK+6sH?=
 =?us-ascii?Q?0HJ2S3IiYs2Jg0Ew+Tk3XAYBvt1LCNR0Pk5iqjNv/llAzUMlC1Kcjd/eVSOG?=
 =?us-ascii?Q?dsekYc2gC36OAvttk6pqbnU3sFt3wpNJZHCm1lLpRB7Ycw0K2lOQVYao/9NB?=
 =?us-ascii?Q?28UuoVzglJ+jMPDHTGcHo+bsDfZ1msnNucH41MPmOObD3bPj/hwHes8UvCwq?=
 =?us-ascii?Q?6fa68vJSPwiAOFIR8hWcBpz4me1yanzaxSBuCCZbQfc6P7/NnjKd2tyrSF9A?=
 =?us-ascii?Q?GmUKJOWvhqWqxmIafBddO26DbV+yUeyo68vgVdMBvchH+y2cZbaW4A1dMtvh?=
 =?us-ascii?Q?t4zDr+VidnqBehcPhZC8GRkkTJjQWltZRKnSTRWVHA2SAn7LtqZt7JUdgowO?=
 =?us-ascii?Q?aJJbpxdfOM3p099YnTqiBk9l7A26KKtdP7YcVgG5itQasByUAk2kD/tb1rld?=
 =?us-ascii?Q?n3rHmUSRg+bapb0x8XnH/9Qv5ZBwZXCuCUu87/jzHI1H3FmkuuqOq8dt+K8h?=
 =?us-ascii?Q?lH31mxl9fwfaKzv+VsgwXNASlnEij1O2MBQVVKdD3xcGYh0cIN63CUTq3m/p?=
 =?us-ascii?Q?QbUNqcRCGEjn6lmD7XSJh8dlmcklz0ymDw7+bM/npUiKnspXdzVBva5kbUHa?=
 =?us-ascii?Q?K5nkA9zv5LXMqwe/moFxc2vbfRQ3Ve+j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c9tc3K6CL8UBeJ4vzI7yE35p4f2VKHltwhAaMv2fHOju/1O1YvGDD8b5uN60?=
 =?us-ascii?Q?NlLJT7O/k7aCzviZ1MSKrJfUXVmf1BPD/I3pjjwmedY/gkD/9B6U9zhHScAQ?=
 =?us-ascii?Q?Td5/+rjTlPIJdvdXGi2kf55tKCUsRVzuYYkdCwCdo1rzEcqdaDmVBxhgWDV+?=
 =?us-ascii?Q?/QMwZRL9IjZ17yILuCvnV2laMdeUOCFD8sOpT4YqVSnyVSpL0KdaBk6xrS8z?=
 =?us-ascii?Q?dG5W+k11n5VRsWaXwfmEiiLRFLqCOI+wTl2gjSgzUQLSBH6TfewX8SMnbau+?=
 =?us-ascii?Q?dWE8fKwKkm9oayN3oZQSdNt3kxQxbPsS1UAObYjLtcJbHR0/keLkyKNER1Q+?=
 =?us-ascii?Q?0XZQieRNRVzkwBV7GO4RmlXCjjUsIeP5td9tJnNixeIa03MgcMX873PNE2K5?=
 =?us-ascii?Q?1PTFO3YdOVUTgaj08FozIBdkgSOiYqWyskVH2pXvHmdvazd1bg/5isyOKD34?=
 =?us-ascii?Q?BYLd0yk9OUaHao9+jRIIwG2kD2/BBfL3hxIVfWgbu0YC/cpW2N//rzyjPXet?=
 =?us-ascii?Q?2RcC9zKFf/wEeQpI1D+Dz8k5CLxBDzUtElxNQdfN/h/qne1pSCbtKls5IQa7?=
 =?us-ascii?Q?2JuDWTJWh4jij/izekrvn+CCqQNpr90NjH1XR/5iJg/++hA41EtuyXevPj3F?=
 =?us-ascii?Q?BPhzVFfWFfT9XdBcfnp58XCuIFR7chp+Kd+uiL2shyJMBp5ChpSrFgQFy8i8?=
 =?us-ascii?Q?dIxjImN1n741xuUtNfX5NX4S7PxJFW0kwqgzyICd8FsJxd55VZqko9n9ZFn6?=
 =?us-ascii?Q?XqjC8e5imkzuXP/oya3hMMjWpHrp1NTzTw4+VsDQVkBIWFSuUr/OyNLYbNeD?=
 =?us-ascii?Q?F5BFxXG1jTZPHuQcCFxMxHPHnHeu0qOmm+eiRejrdhVn+0TYnQZ7nhyUmm2s?=
 =?us-ascii?Q?jCrWgSCzHIwRnErqrlRkx3dFJMrTdun6yD7sOWAz0Wq/QoNtyXh1tYrmoxWj?=
 =?us-ascii?Q?pcmyptfFYp9vk6AMREaz9t/2QZwmH0sXElcgdqRGpAleieK1G7tQFwHlHF+d?=
 =?us-ascii?Q?VYi+5EbIsFjz+kg+bjxJyBh/K6rZMg6WD59od70/7cxLg548gKIxs1nwEtgs?=
 =?us-ascii?Q?G3wFNNO90LvKorxIpYJTljf2RVFthh9t0kdOiz+QMPXMzRqbcqFS6F0uDYRu?=
 =?us-ascii?Q?V/uKdSwks5Nmc6TwLAkdrmw+tsjGFU/63V5F92ibFm7V0Uk4d1rl8p1pz4lG?=
 =?us-ascii?Q?Vkn2mqmd+XZVnFvNO50lLq4nC4KODnid525oj660UCsFNbKkFlk4UFJLYnYy?=
 =?us-ascii?Q?V05x/wrLP3CjPNApeqO7lFTYM4xEbfJXRL68a7FPCQs1ZXR1gxzFkEoLpUcA?=
 =?us-ascii?Q?0/270R6AAYPCwD61/zbNfT9Dp32JddRyw0V/zeAgRyjv3gJsYMeYW4tEWVzk?=
 =?us-ascii?Q?c4wCIoqvtxWoqPnzM8jTnIBJJBKB3JRA+jm2biyMzESmHf3/oBokOGM6C2nW?=
 =?us-ascii?Q?Oc17JemBvJNXd5DZvg4Kk3FsKQAykfRMEyR2e2+0lx9sbkPqeVgyZd8oLngU?=
 =?us-ascii?Q?1PABToXRKOB49reUynGG5G9jaecc3YugDWnwSmzokTElrF4zlcFHJhZQT1oi?=
 =?us-ascii?Q?G4Ywlh/7d+lZwbPZ/1eeF24MgglI//4U94YEalEKBrn8Cb47qV0neDvIAMHV?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SzpieIOisoEBWLrWbQ3JQTLQsGw8aNmRjcEUFmAP8eITDklFYXhwWVM6dLhxmepWAeuE0tSFiU2h0mZDGgJU/o0/n0h10JqlmeuiWHeK/BT4LelXB8kkYJ0qqtSXCciPuRUY6/eH/beqzAD6Ld6Ql/RRKWhj6i0r3OAx279fzXme5LGo60SliJB6VjxdiuKXzREKrVYD4RyQ6Cgk8E+ai42ct/u8Ipst31nMu0zkDIfa1vuOCd8bSZ/c5qy4jI9aUlIvvwLyq0bpWXqNj18jKbzDlAVfWGqWqZw1KtJoOJ85ovlFCYstIV2Se7MT3KHu63/G9mv+TNRx9eJhvFw7r4kLqH81TsDOW5LSIjHH4QpHihdWHietnzEoDhpS4n3uHtykDDYIfrZmvVFoPbIeT1wjLyKZROWXAHE8w+86+5+5wfqPlJFyMVRI7mKi/CaFaiNuegVgCkVxlmRM0KvxYvlVkhjnONOxks+/6EhyDN1s7k8MlG8TZgvjR50STqAra1S37TjVHJQGK1Fm3+bOUgUS2mBugYQu44kMLRdBdcMnG8QfoO3juYPYt+5NIIPsVHJCSRpUMTiEc1UHHpVOuxLvJKfEam+t/Nf0IiygzMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da336628-ed9e-4e73-29ba-08de05b74199
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:36:17.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5VCcJLmV2UfBH112EMNE+gGmoyc0kRQ0KHmMFeaPc2u76vP3jXDrp3FZBwFNNPLTUuHzA+ecRxU6ONlZg3Elw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=888 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDEyMyBTYWx0ZWRfXyvFNFdZkJEmg
 zLeS7oKCid+BD7nnm3xRnuHucobCZS1qhs/Uhvk/D4bsSjwyZ9In0lbJtOFhjUkozxV+yp06egc
 gtIcDUKU/GLHzopXKb/wDmMCBpoKZOa8I4vVzCD8382lEn11XArUzHL2VFukq6cL2cEFm4LCLtK
 YW+UJFdo+kGq8LOjg98tCkls+EQ9s1930KGF1lTTsTiHqHukXh0Ssf51wLx09v9WYo8shUgtuXZ
 Y0JawPJV2w7VXy/CWnaX5YRmghZYp2/aYb8cJdNpEilAyyFCTTMfLFpDORsHlN+CJfX+B3G28kB
 z6m7FCDd/G+xlCuEj6k0YQE/cIkLVGznoZVAujT2h4zqF8iC0q1S0w+0MKyyFgR2R04GBamZHiZ
 mNx04HMZ2xB6714l91A8hJykGhgTSQ==
X-Proofpoint-ORIG-GUID: w-IuuvpSUWwdh5ExuXd-xpTIkP6ec8oR
X-Authority-Analysis: v=2.4 cv=acJsXBot c=1 sm=1 tr=0 ts=68e53378 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=RqkrMn1H3FNKlyJ_U6oA:9
X-Proofpoint-GUID: w-IuuvpSUWwdh5ExuXd-xpTIkP6ec8oR

On 6 Oct 2025, Kris Van Hees spake thusly:

> On Mon, Oct 06, 2025 at 04:28:24PM +0100, Nick Alcock wrote:
>> These two tests probe on sys_poll and just hope something calls it.
>> On sufficiently quiet systems, nothing does.
>> 
>> Define a trivial trigger to do so.
>
> Why not change the probe to be on hrtimer_nanosleep and use periodic_output
> as trigger, rather than adding another trigger executable?

Happy to. I wasn't sure if we depended on it being poll :)

Patch coming shortly.

-- 
NULL && (void)
