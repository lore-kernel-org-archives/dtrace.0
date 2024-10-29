Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5C1925AE
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214363; cv=fail; b=QvDMEP1n5MaCG50rBItO1xQ5mhzRlOnA1YYKcwglLXKChMVo+nKae+bGAJwDd/K4SjvBvwQeKUqkcvhglxDBkL5XC8bbkUjGOVvs1B/kYLxoQUedECiGNhiyzIgMW4itfVNZx/vLk8Dm3mt9yV9SkCBzzXuHvb03Rvw6nr9/lqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214363; c=relaxed/simple;
	bh=Qp/PbV/uXhXCZ/a8s+hz0uMn1zkOy7PhPYdDpOXM86A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KV6PLAu9BfKYSkdaG8hZo8EOgl2HmDL+wVa+lL938ScSlk06a0Y8mPRfWZdUPTxqtPaM2MUoBLuIs3mSer/xyqa3g9BM8PStva/p3sxxdsYGP8zcCIyK+Zqeg3Vi13Ttb34nKcy8LxpyY/C0jnljv0JBBUMEvvUPbsalW7+cxXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hK8bBBNN; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wjIaCSjz reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hK8bBBNN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wjIaCSjz"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEtdXI026083
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=gZNfvDKyTQKEezzq5w9ogPQC1ySVP7CC+02EZ8LC1LE=; b=
	hK8bBBNNSWz1tWDQxuPmFQPV4E7nfPVDXOhGS7A3TT0QSNOL/C0AKImNzFjjSkz0
	CQF+a+tAHGh/ipMNJrdLc5ksDq/STBC+1QFWnPq6fHucFMdmY3YleF+MA/oII1Gj
	XzxJNDYUJZ4xb01WrJ6Ktr7XNOU/FCz5iKObZKQeQufuJIjxXycfJ5FtZ10g4BKW
	Mnvlp+gBQDTGGywGigls45T/qRKqpaC61aTf4w3TWN9kQQ1nIyUxzvLPakIA2Q83
	4X2F6Pk5gs0cOYxiNedR/OggNS42GALlvc7P0423jOQ3tU8Cu0OUuAtvkAKjwmwC
	o2I95LihmQy++fGhepiF6w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys5s26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:05:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEjq86011745
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:05:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnacn5fy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8jshbSiXFV23D8SFVsEPn2jmMnQfwhUuxlMq8ZoBcYEwkdhT6alruvWSSUM0YcsDBNy32hD82+0M1aTUrjcIZTwNqVEe9oeY+MCj09lkA77wWz4QBC5nFXPfpYQ9QnUl1bgeeyyEF+Y9Hub8QDXwpYLeWgziZSYADMcmHTqD1RBp/VOQ1IB9BFUmX4RYYbDKk6PottQUKjp3InWBT1jm1gEVbW4rHTjzZ49Fe/BvVJycJA5jKVkJcnfWt+hf8+0VcD0JjEojEyN9o/Rw1chU+P9vU1+4pMiet8fLnwJqeSPno5ryUUcq7PUwrhZpuOTSuDwmjBN+sf3TjKcCTVm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW9sq1tFeaNvrww+YffQ99totKOJ3CM7uwCjvqTv3Bs=;
 b=I45oVxgGFihEgPdL7tg1d0bEixmeaBLWqQl0JMDTxiAmCo2BUTtdAo4krOdhGPBbg2J2UMEBUP9LW9B+RFwm9ZLfLiBB+sXBvhA3OHNIp+9iX7IQxV6FG3JL1NC/wMr5Y7QfHjcO1x0M1+cvPN/ZsfvtCd+BaLl19ntkMJPP5QsUbTpYvv2m889Duhyl7N7HfFFRb+8kayWv405tWcd1b8bcPLtgOo/VXYRKaHoWo+9DkWMtJUXXHuT3P7kQfeJ7jBeqx2t77W1SoDsUMgsu2M/uswxdKzHEW0NP1K1eKksNuTCP1BeuUja1+xJ5cePMY1aTk1c0KqoZ8KL87Db3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW9sq1tFeaNvrww+YffQ99totKOJ3CM7uwCjvqTv3Bs=;
 b=wjIaCSjz0DhVICm0ZWwPRAAyivBCGt4rqRI0Hrop0x5mdVE1aL+8gWSJriB/ja/0a8Md4W1XAOysh+EdcRg9Dl1uERJ5DR5evzToOK6WCDWWEGF6Qxn4luY8x18dv3+rBcGvWAl3TfjK/qDupUXHdmKExL9NqOlJJjWq8w26Dzo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Tue, 29 Oct
 2024 15:05:49 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 15:05:49 +0000
Date: Tue, 29 Oct 2024 11:05:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 26/38] test: Annotate xfail (chill not implemented yet)
Message-ID: <ZyD5yaBs0BOlqMZP@kvh-deb-bpf.us.oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-7-eugene.loh@oracle.com>
 <ZprWruD8mYUA7zW0@oracle.com>
 <01ed8c58-ee33-c568-0767-2e246564e1a2@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01ed8c58-ee33-c568-0767-2e246564e1a2@oracle.com>
X-ClientProxiedBy: BN0PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:408:e4::18) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a8ddb3-907b-46aa-2e63-08dcf82b2c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?k6KuLPpcWbe2SAC95GlfktNQVtrZjqnXJM9gbKdMQZnS6sT17+zy15syk6?=
 =?iso-8859-1?Q?q36C+vgPnE6xIyuMY3KWK4d3qKC7do4MbgO/bhndIsT6mq/xMquGt3uo2O?=
 =?iso-8859-1?Q?yxPSV5ZOHaPUGEEMVLv946KCxzGyqu9XuiZIna1kaPiQu0RoTVTrCxoV3G?=
 =?iso-8859-1?Q?UT+/iJGvCCa9IqFbZ/FnGSq05yBBlXjCa+i7f9Jn+/Ag86zPW35FKl23oO?=
 =?iso-8859-1?Q?etatERC1EOuLN4Ft5a5DiiLMV36FpBifSaUW5saNTry2B0bjsvFbOzQUkA?=
 =?iso-8859-1?Q?TxYhJ2lOV24JOtycAc+QWhbLMYkapAaxqkXO+F+ekQO3voXJL6/wYyFzxQ?=
 =?iso-8859-1?Q?/pRyXPyE0fYlU4hV4gkL/BidVd77N9l5pRwD5E4QaoXPRrYZ1A3IWgpv0q?=
 =?iso-8859-1?Q?uAsSjjedVDBHu9vdVEvAqnqkFvpy5WY4BGscHRrMvep49nVqADtEUzxs41?=
 =?iso-8859-1?Q?kjxxWNZFrRjmPfquZ+T26NtKK5KS2yMOYVEO5mXNFQBOe78mpDXGQpPlh/?=
 =?iso-8859-1?Q?SLKMBDTRPgbQ4yXh1SNy4aUPKPqblqIM/bl0NBSo/bO2bDpIXuNvBftyIu?=
 =?iso-8859-1?Q?RVxNGQFLu8iz6l3H4i/kIPYpL1bHZNmH/0vF8kwlA5j2arcnIqJicgZN0x?=
 =?iso-8859-1?Q?ymek8bCget1LEDALW8Gdg96j5ZOLf3NNITCsnCC+X3CaazIEdtbI0K56PX?=
 =?iso-8859-1?Q?/iBw5mhAp/IVxsyLEeAqwQI3iHXMi+y2+u6EoLligT8pPb9+2+NPZFr7SP?=
 =?iso-8859-1?Q?AAR+VIe3UymAnCzrDmJ9dkUdxVTRTAlqm79mGOxZQn4pZlSm+prBiXHWrL?=
 =?iso-8859-1?Q?3ZQaXX1s3tQ3eB9YqzDSpzSfSfkQ/8GNvLv/2WrrxtOF1IyO1hZ7RdUOnJ?=
 =?iso-8859-1?Q?JaxZKpC4K78tYY3TD7tM41nm8xvvKIm0XVIMTOW9fWYEdMlk0SQZ+jD6vx?=
 =?iso-8859-1?Q?HVDvEtX64bG22dMQWcqCZ3kRskUuZ91MwDGVkuv05o2hSIu0D3iyDF1vW1?=
 =?iso-8859-1?Q?3Jv83MYWErpQQYLQrPCESYyRFKHoe6hHoghmEAaDnGyY10Xpds9505AQU6?=
 =?iso-8859-1?Q?9sgZ1L51o/gmF7r83CZcoQXdZlBWCUNjum66JZrqqbh8GYEsBDiLB1Cemf?=
 =?iso-8859-1?Q?TCvrkOaoPpXHIuGrF7Sd9u8TxphSqTfdUbdrsdSzOq1oU/stbTUBMHHLmA?=
 =?iso-8859-1?Q?4IyYhdeo+wSSH6A4YrQ+d/0ExkEB8dm0DErellNUoqd4MpdnRKfzQa7G4h?=
 =?iso-8859-1?Q?yhIUhrIzks/rumbs9uJCxsig5wULtDDmc5C/lsCQb83W7khQXWzfGEK+iB?=
 =?iso-8859-1?Q?sIwK9O7dkXAUfHsNMThdm82b4+hFfRUQXnpUIt+tTnqplFQrwhyS+qfO8S?=
 =?iso-8859-1?Q?NnrepCm5gL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ABxq1DS7qCutOGtH7mIQmPULIRWAs2lKhNKYqQSdj/PXwzQFev1vvs/dnW?=
 =?iso-8859-1?Q?KYlwDbYXMjH1lRIZL9wqTw+q7Tevp7D3RvY2CQ20/Kfew+5iVJHBJWKqDE?=
 =?iso-8859-1?Q?ipxlo5TE0bMw6teFQ4+5xrqDPY+Lu6KGxet+WagLE3ie98d3z4JajU1ikc?=
 =?iso-8859-1?Q?dBk+dznmHiWJkZhNjK0uza7o8fybfXXE7WAa5D8gvqNSLXsPSDnr9VPg1r?=
 =?iso-8859-1?Q?NMd46RcV6nbmp8f6FkRQIdy+koaaA6V2aHx7KtZQo4hXryrZmWUywlCJ6N?=
 =?iso-8859-1?Q?HQm9Q0rB0FiGuWjsEqCYTN13TnKlm7xvXxNFLI/ezx+hRQtuzPEumlJ8IW?=
 =?iso-8859-1?Q?T8PoDoZEWzVAUKRUQjrCGp2J75dgL8lHGemu8OvCdi1xsO3rzCbe2wEWEZ?=
 =?iso-8859-1?Q?3c37+46eol9bZz3o4c8wURiQeUi/feMfH9QajqsvhhWQ7ORW7Ni4fE0t3d?=
 =?iso-8859-1?Q?9ntyiZv4PkrVzJU+GnM1bCk6otSTcV3yMMSI0gJcz9FKQmbvTTM3CC7kaf?=
 =?iso-8859-1?Q?felXa+9ZZ3NSKfv5tOG7LCYqUoLm2D+RiXHehIRNCwS2a1ry5OXCShXW5s?=
 =?iso-8859-1?Q?UPgf51XTWb0ZB4tJZWWdeRaKOrIKw+1wf4OD3xJTKa4/pIAoE5+7NjkoPT?=
 =?iso-8859-1?Q?zwO3dNHUnUHMXyL5qTIbug+0BRRcNdorMh/UT01clD6bH9wSWUTOcACSyV?=
 =?iso-8859-1?Q?AizgmAnUmHVof0iO83Ozv0ZtB63cwh4UIXFekqngvhk4a1M+znd3JDDxpO?=
 =?iso-8859-1?Q?qjLoH9i0gc/F9VG/rTK9/RN28M9XUklpeyiUO7bIqwXHwFSgUtTG3j5kmw?=
 =?iso-8859-1?Q?Sg4qiC+HUqXA7uzmGCXGCxY+2VRNB72dfGrQeToPDI2ovwBKnPgvL1ZnrW?=
 =?iso-8859-1?Q?RkLU9hBn92/Ou/ORMoQ90/InvZXYDW0q4FPlKkGbgHvZj730PahxubD4YM?=
 =?iso-8859-1?Q?UFQWIIun9OpJ+oSluycaFX52xr/Y3cRX4NZJKjMPl3dL7V/R/DZlwmMjf8?=
 =?iso-8859-1?Q?KeY0oIi8R6JKhIdI4OzIHyIDaaiXAO2PUZ2Ss/KqIQF7ZOwzUBDgmiYFPE?=
 =?iso-8859-1?Q?dksOVgWqXpZrTL4QObhvn7xz8csE/QNA+WG4PYW4vrwJ/NdhvlveVqzZHy?=
 =?iso-8859-1?Q?tdyKwcI+35Nb8xH5PR8VNbE0u8DgLellTHicrjG9t11Lg2mrG1GFW3+GGP?=
 =?iso-8859-1?Q?q8Hf5uZ4wLMAQKaIdgxMVo/E2zl3DcokWr7rJ54tOrErryZ7oDhct7aNxO?=
 =?iso-8859-1?Q?FvZ0sqaux7IvK6PBJy7TE+7DuW0dH/yo6mb5O7bps3gjn0Ha+4i3Z6PU94?=
 =?iso-8859-1?Q?ewgUAgyUhEHsRvC3eTtu2OOMp97E6PMcZifEu6d7BjGjOPMTvulsjYbHEf?=
 =?iso-8859-1?Q?MlCF+8yxYS3dBw9YOa8L7aUjfke6e1WDMI2zLymcVsKlvnncUzsDcPIRvq?=
 =?iso-8859-1?Q?4QutMqYFsuiZVHTWaCwJJyHLZd6BmyCw9hRx5hwsGAdl4LjtR5wqJEWDcC?=
 =?iso-8859-1?Q?bBInxtdXKzoL1gkqYalgEVISjcigR9Tx1yZLbaUQxoLBNBTbHoMiDOsVvX?=
 =?iso-8859-1?Q?HW++SjslTV9TwYtqqBk3C/59w+VUNgghVbACLpq6y31N0ajgoPvOOVcLpS?=
 =?iso-8859-1?Q?wgFYIT04hteDgZZihWzOj56DEd+KANY/AshFaysA9Ayzby5hU1UndQNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bx/J/3IufqK/vRnlop83llZatpQ3wj8/SDN8mvLBMbjetp6D+9uTfdptCggfKiTngejp4p6gk0CVNOLMVKMMFzpLHGNGjU3uUtEmB5V9es048DA4fllPtSP46CSGr4CZYZLXIBs9ddHza7dlal1E+fVNBhSdBeWxiIqTE3t0tl4uXdM761/XXwRrSAdz2bHlmNYNzFM6bcQgkPQln09T0dtbJt/Sc0D1PbMdFLbcZUc9qWwIBd7DTolGEehtSEri5ttwMhxI18LlhFQZloCH4HxDYOd1nsW7XVdfeo4sUWaii9GbR19srmZHo07cYCSSrFo8z5Qz7Xq77KM3nzRlKqEtK6vbNcCWdmF3ScsP9rMvkIS6h9shPQ/l9MkMGXzhwaqnsWsFXf8Rhw5tN3dqpOueWAIj9I6FkYIViJOL0o2h/MKEJ6bTR0mKraCdwNewvr966erCmk8NlHXLmgbX4og6gNWNLZ5cg0Ku/ko54/+i/dldSE6w+BNB27j5Ycf1YkVKv9CKhEFAv7cz4DCFzRww7Zu49sTSYoYIR4IZou39GDYIAlNWykaIZtsm8v4HLoO51DvIbjznjeT9GtwcxJYEdfgstng+uyEWbF5lMlQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a8ddb3-907b-46aa-2e63-08dcf82b2c84
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:05:49.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AOVy04VIfet84PFf2+af5KVCQYA9RM8fpLEvyxk75AJjqDH8FLBG8PDcpneZUPZqGs5kOkwQ2APmey0hwe6o5xts1DdLyl1xi5LzkP5P+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=760 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290115
X-Proofpoint-ORIG-GUID: f9dpImgHsFAD8R3phciXcJdeRSyRm_Bu
X-Proofpoint-GUID: f9dpImgHsFAD8R3phciXcJdeRSyRm_Bu

If memory serves me well, I think the plan was to change this test to not use
chill at all (and remove the xfail), and introduce a new test that exercises
the use of chill in the context of a clause that is a zero-size speculation.

On Fri, Jul 19, 2024 at 07:38:33PM -0400, Eugene Loh wrote:
> On 7/19/24 17:12, Kris Van Hees wrote:
> 
> > On Thu, Jun 27, 2024 at 01:38:52AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > Before I can really assess whether the annotation is valid,
> 
> Well, I'm pretty sure the annotation is right.
> 
> > I'd like to know
> > why chill) is even used here.  I.e. I don't quite understand the test :)
> 
> Well, I'm all with you on that.  I'm pretty sure the chill() is pretty
> irrelevant and that the test is "valid" and passes without it.  I am of two
> minds:
> 
> 1)  Remove the chill() and @@xfail and move on.
> 
> 2)  Be grateful for idiosyncrasies in the test suite, since they often turn
> up bugs.  Weird tests turn up weird bugs.
> 
> The patch was going with #2;  that get my vote.  I'm okay with #1, however. 
> Feel free to decide.
> 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   test/unittest/speculation/tst.zerosize.d | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
> > > index 56c1fcea..996f1257 100644
> > > --- a/test/unittest/speculation/tst.zerosize.d
> > > +++ b/test/unittest/speculation/tst.zerosize.d
> > > @@ -5,7 +5,7 @@
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > -/* @@xfail: dtv2 */
> > > +/* @@xfail: dtv2, chill not implemented yet */
> > >   #pragma D option destructive
> > > -- 
> > > 2.18.4
> > > 
