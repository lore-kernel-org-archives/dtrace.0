Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC3139CE9
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209591; cv=fail; b=cC8cmO5dELE/Qo2nxuKITfAFdK42eSLnRkmQqcuXtrAf54pUH5rQpUDCfYD8bCOe5NhEzXb45J1bcjVy7v05vja7XmhKjDO0G9WY/KyTGyhniFeTynqwLHh7E/3o8e+pvajqyBcYzOoq+vTDbSSQoSK2Z4QU6OB21ZchuNrYCCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209591; c=relaxed/simple;
	bh=UQIzHIfscRI9kuWAtkqQKgt+9JoM1zQS+5JX2+fTKek=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1e7vPXUTRgA7SGsyJ+mAnaaXY/pb85XWSTVasxDS/DwQkay8bs+qYuaLJ29ykxFg5NU7QaSU3OqEb7r04Mxv6WoS1MurZl6RNLVx8FYt93/nESz/CqE83iSh2thdq2xc0qx29O3ZVPa9GWBfYyWJ+Xlwtri3arCKi7BBjNaprQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G4zqlZha; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CirlqVjF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G4zqlZha";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CirlqVjF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMZZZ010240
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=RBILWhFUz7VGTu
	nviTahOiDB1LmalyxTXd0S7F2llfs=; b=G4zqlZhak/IJ5x7XbC5lKABmFbmiPW
	jXl26wVXmwpywNdxiC5RrL2bAUT0QUrsKDDWJrmy24MwdrnPoCNwZfDhNEV+W3TQ
	ARP0bna+86IF3GS2ko/dL5oDN1D1W/AaPDm7rZCYP5QSIT+ZroRVv3+UjuzvAhyt
	1vTcuu/pmxZ0SsO1/ywcF4nPuq4LoCTe29kUk6Zl+dr8HmL/VILvW0oe6YORmVUH
	GcIdXuCKcfTs9bKY4GHVNQrQagLgb9O0wFB4+F6RXKThiQ2aZbjpM8fBwIjVMHNF
	esKVG5ypyib9eJCYrzhoZ9bcz1BH9rzn868nNRx2XqdQAAsitEvcrTZg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41smx3646t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIrgP4026092
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41smk9rnve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVOt0Pdz/pLYcRlcQGBlALfXTHNd1pAgjera0dY20k6j5FJ/BIqzUNDgfMUThhw4KAwj2Pd0eTdcAy8ws944LSigK0F12aVk5SAKTef+/EVUkxHUfJ4t7y2boPxH8xmvcEX0trLdSlW6lpkNfLul5AbElk2ldbdyrMR8nmN8R22DvBhTkdeEAMVrt+sYCZSfRy+s2tw28yU9a0mSmERKPMMRdGCq3KyPs6BFXjkIuKb2kJcBgFdbdZ7dBxuYRCBu/5528j5wq88V60cyO1ZeB4iad/oskYjeBDsAuGGEDDjB0FlkHm7/FniX/5DW+CyKPpIz99j78+VBM8TTI/i3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBILWhFUz7VGTunviTahOiDB1LmalyxTXd0S7F2llfs=;
 b=dwF4rdLBWlQaVChf/jh3/NszQuZnwsGHLDgVd8HEvYdXlnBj7Ue1LVTCjEkXQLKWTaI3lBgnkAhzA3UCzS++6DIqYrZRdfa9MWwSEThYS8wjKcdrwNsAEgJo6j4w7nBmZ4B+xWGEiID087BqqJ5NGCQ52PSyRV5XETlrexAzWFQpZnCBf/Ik/o3XENTdeSkzKFakb1RaiiVlr7oOEaxs4KePkhDsjaLcL4JB0DZxHJ6E/O6aN+JuQBhkvXyILPgXCMm2D/U/f4oOppaVKnH5BS6ANxALIetEW6HqXsDG+ROz8f89sp8/Fo1XhcmuimA4Jz1Z69BpNwOXdxvUZ8N3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBILWhFUz7VGTunviTahOiDB1LmalyxTXd0S7F2llfs=;
 b=CirlqVjFKK7F9C9fTePGWUhsL8FIqqyVoIu/lasp3h0DiflKfQDzkT0xGRqMA8slmSTLrdCvJFrzhj+SWsNe6rrUeKlR1DC8rwOu/Nb6sgJx78UlQHslA8fvB3gBAySTHkIM4EX8nozbO+N/fREHRFfTEYGrFA2I50WIlLMG7Sk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 15/19] Ignore clauses: some clauses are impossible regardless of uprp
Date: Tue, 24 Sep 2024 16:25:54 -0400
Message-Id: <20240924202554.7011-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f177fa3-175b-4d21-6a47-08dcdcd72794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2YO2/2QE36D1fXNemHH9yfbcx5Vscb+JJs2LeIOydeZ9bOzpQOBcdixt4mQL?=
 =?us-ascii?Q?gmRwALXb7IMGhlS08C7vx4toF7UBP2dHd+RAs2gU572fvmXqsXXyX98+xXyl?=
 =?us-ascii?Q?HkQ4P7D4y3VuVuBziCFYzHQ/J8aUa0qRdwnfk+WZEENemOnlZ2dQbdROifzI?=
 =?us-ascii?Q?Rjojha9V0ZMwPHIpGckT6tAKlsJg9jRVCYZOEM+ay8VO91GJzkVJrzBShzI5?=
 =?us-ascii?Q?jTiP2UyKazljma7V25Dnr4DfBNEfN1kHT/12DqubWw+kJtuLsdfOIwj4jHll?=
 =?us-ascii?Q?jFqOBH7kf9cRzYOyb4QPZUbfxDrBJQ2vjtLHblvUEJ3T+rhwm/p2HxBVmsl4?=
 =?us-ascii?Q?uuC8YZiIo+p7YRP5unfoRgWYb4nmyCIQdGTIlxHzH+oEbz2nvl2wwtrYPHin?=
 =?us-ascii?Q?Vn67YqK1amODDr1i4oP2mkphoo/4ErFY6cxsHiGD7/1S85DDF1z/BgmRJzFM?=
 =?us-ascii?Q?VSYtlaZsc3ZURcgINpCem85c3alvLkSBnSpMZHD2ZsixcILsWwNqv/F4EAUg?=
 =?us-ascii?Q?/IN5Uy4fzE4LCjRoqNf1o4LNdqR7kKJwE3W6ehmMS9M67SM2VOjxEmHF0ojc?=
 =?us-ascii?Q?O2QzjeemUBmmz+0/bFveZ8bsakOkwhYhy6iZOxzJT2yU/rxusHnMMxECeWJx?=
 =?us-ascii?Q?I09IeTI8wjRSanOxpQ44qhGqPONf/fVnKr/F4sLltSEC6XlDsnxrmfdXOvIE?=
 =?us-ascii?Q?x8wzymDj2MvUKiwJ9sh2NimALjKuhbyV3RAbeaetEO7Ekuxl8USJ4gKksp0s?=
 =?us-ascii?Q?GnVfeS+L8j9IGUA5qI6bkU2cmWUCyb2xRWC/THdwzRhHKzAZ9Y9pgMpcHqt/?=
 =?us-ascii?Q?MW4UZu7qwmGE2BbevwTz0mpPbkujg35Yxiucj1x+YpC3LohqT29ljL2aCk5C?=
 =?us-ascii?Q?9o4ju+6//2rJqHNZgJwtG0eb29kvI/9wuwU2Kq/2DIsmNBu0xvupAcQj+3XL?=
 =?us-ascii?Q?2XW4LeQL9OKu5qS0y86jwNXJWqD8GoEd2hU/+b4hHWF+zzglEp8HzsuyITXP?=
 =?us-ascii?Q?Ee+iq++GPuTRFb5q9I9np7rLMWL6pH6cVBFLUXAlQ3ASgA0avnniDskBW0QG?=
 =?us-ascii?Q?NsC3xU81E/NTJGV/dksZPt5dly/jN6ZHKlvJlqRvqjaiuTMfWIPV9EsHjGQr?=
 =?us-ascii?Q?rkiSjB18dLnFMf9z5D1IGBr2fXg8siw+H1CrHQAM2CyYWtpxXMenrlLeRu3S?=
 =?us-ascii?Q?8SeroT3nYNFXTd5z+EsPUh2eo6oUpdJJ5hWQ+tNlwWcY7i9CSQ+7GVITm3gV?=
 =?us-ascii?Q?b/0FwcH747/0Tz1Tj0QvmduqRJGnxffGptbQqhcqJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a1lgFZfR9fNXuBTBDdqTyvw/1bIYjaNyQNjDXHNSFQ2wEZj8mSzM2oRT11xb?=
 =?us-ascii?Q?IIR+X+TH+RJ6XfI9J8h9653hP1n1Ba1DHQH4kUK9elRGCjZas+1MhWwcZPuz?=
 =?us-ascii?Q?xpdHM1uyqMqrDRp1SPxh1INYTrw+ZNDaNXpFjhVxm1c1SvjsQbflRrNSOlHl?=
 =?us-ascii?Q?pamDF7XnKhP8cSIYyEUFqr58+/bw+rpbN7r+ywY0oGlyguriJi6T0WAiDtFq?=
 =?us-ascii?Q?TYo17H1OWv8dbBEBeMSKBGtGuA0u76Nb4GMwmvIcnaB9BPeX4LSQzsAtJizQ?=
 =?us-ascii?Q?yESwW0X5Zbh6pYjG4mvYn4TTcNOOLgFEcYPEmKyagDyy/fEtBpYKjjQXLzsA?=
 =?us-ascii?Q?sRlUSB53WRYerdsBnX6caO+sMA6M/NO/CEojQ1tH4oaoCemwqpVUO/OKddKj?=
 =?us-ascii?Q?HMTgGin3qS+IdWXqNnP60ZRTe/DqI8yKMLQtuoQgLQK8rz09gqyj/UgaG3j6?=
 =?us-ascii?Q?+UFahWlc/J0BQeJZiun5yeddcyWXrwLHEbnU4YCYqIfm8rLPVhdqPA9+5lJy?=
 =?us-ascii?Q?LgzqAMmQOGm92fH/VAT1zUKoXGwQLtKQuXU6nD0W+3hrYl2U25YTVsRyrMqF?=
 =?us-ascii?Q?pGCNXncpp/SRQVMLwTuxyvvrOgDBb3nlZQp0fpFfix6Xol5DUl0tPzWRnoFe?=
 =?us-ascii?Q?c+mUXMzpySvxGdGQJwteEUi9S6x7c51B0hCnZ9TPaiCAAGWhsSJOlfDrk9lu?=
 =?us-ascii?Q?4H5FR+Q6rS+BCdFaDM1W7t/VxJ9SqD/WIr4kCouB+TvgPnhkc4Dl3FMtMi5x?=
 =?us-ascii?Q?VrIxEHi5ZYtbkllywiAx4R8uCnx+O+NQ8kPjI+Kt/kO7WyRakmywp0pfB1v0?=
 =?us-ascii?Q?Y8ZXLmAitUYNmGHU+SaKWTSkmfXb316oWuj5HoPaZfJcBSg1c3Oe1AcLe1Rk?=
 =?us-ascii?Q?7D+e5PAtWZjdFFBAd25E155gvAetm25q9IHK43taWQXb9vRF5LdN2OuDYjpW?=
 =?us-ascii?Q?nkhud+QUUuaNuaL2u28NupvUSfSLCMF2ORC8vD1QoWo9NWQpF6c/q9uBaqtH?=
 =?us-ascii?Q?hG/WpO4l3672Hx+dEuxEWjpl+P4/z0dhig9cirufN1SLhXKjNWId7HZTCjYk?=
 =?us-ascii?Q?h28F2fC5Tm9aSPHbRKNGg+vYjbG/QTNYUuHK3uNAkLfz3YN201iR76SNDjbZ?=
 =?us-ascii?Q?kqBcMnWWvrBsIZGOxlAc0TsxLD0lyicX1o0EU5zNiCVw9naBODTN90Nmu8pi?=
 =?us-ascii?Q?YW4WUOKdNcOJY89SBApABT7RUmSvsHZRUIBNk4PYrq3wKwzVe/c8gw2RhJ7V?=
 =?us-ascii?Q?Xn/hJ548FCeBlWeZOWkhfkkN4JUW5COaf7+i/L7YTiHEyZG4bU7p7uF23yfb?=
 =?us-ascii?Q?wU74Teh+s4qs8JpuSGVtTD/sYi7UDTzKtIxxMxCljaj1gzQau115TIcjW/Db?=
 =?us-ascii?Q?AmY3qheOTE1Jby3pF9rwdGo8/qqbadjMi88CAKRSGuX0eonxC3vEeJR+hS/8?=
 =?us-ascii?Q?WeMxnjuXnmTYFJhK2ov0qFcs3hWA1iyzQe/1VPyfMKDzCbri0SXxHuTxp2W0?=
 =?us-ascii?Q?l9HNbGrqhIQAcyb7zXHakMqxPb7ZgrKi+J4bNWaYKUN5fPPjdxNThaB5O+We?=
 =?us-ascii?Q?d8EfHLl/x3gtMEcTOOASPCk7cJSgPl3g6Vv2EG9P?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dhUm3zAPW2rhwlUNaXqox0UvDqvN3NjJFU6DQx/vB5LmgSGlygEGDOkm3aVtQl809pMrh+89WrZgqnmXJODA1+hEscTwOZDyluzl72sU8Zg/nKQaTGp/l5gdJPpGvkE+OAmVHz3wg8WLYUe5/iFQRizdPt0oPewhGo1u6pThpaXtqcvRlF5pDv9rZ0K1P2Gnvq+pgH5UQPuEEIyINFBQDismue+VDOtI3W6dQhmr41P4/RytlEaTQaXCtWeEUZYn8uXxUyu8FJl+89gaa3TYOPhmPU4MPB9N0BEcCqRI2KUHbmnCD65mCk8DcWEA6b7DlHld2aK5fILK73e4x8fic7UFp2kA9bbkazjDEmRcDJZffWCS6fG65Ko5JONV+YiQS8csxqaMaqFWVZvGbqxJw4XCkKzjLewyq7EHTTUWX6hdmUSGyUobeeDCOCiRfFecSIDL01Z9xT7RB1KSacEfB00OSjbivmbCVvc8nerLWVJdg3jU3UBVEBa3az3r1d7SC1RbZdITe3jNbKcVZ71a7Mss1yg7sc8gyjiFNFXolqfNpZKIu05hpiVUaz86pONJ3CJK5s9CvCXlZOKiyXOz5s6nBp9/UAw3DJyG6zMGM9c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f177fa3-175b-4d21-6a47-08dcdcd72794
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:22.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJe9WvtTHsvuzVEraYe5gMspEWizm1u3x7BRZ0mKEbyAGiMvuQA4ayzN4J0iYzLp3Vn0xFDHKbeSlCgHoHKn+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-ORIG-GUID: PfmJsEumMm02-RHpWXMbvCkwROxEreb1
X-Proofpoint-GUID: PfmJsEumMm02-RHpWXMbvCkwROxEreb1

From: Eugene Loh <eugene.loh@oracle.com>

In ignore_clauses, for an underlying probe uprp, we try to
decide if we can safely ignore clause n.

Meanwhile, for some clauses, the probe description tells us the
clause will not be called for any USDT probe, regardless of the
underlying probe.  For example, "syscall::write:" can safely be
ignored, for all uprp.

Add a dtsd_usdt variable to each statement to track status:

    USDT_FLAG_UNINITIALIZED  not yet initialized

    USDT_FLAG_POSSIBLE       clause could possibly be called
                             for some USDT probe

    USDT_FLAG_IGNORE         clause can safely be ignored for
                             all USDT probes

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 56 ++++++++++++++++++++++++++++++++++++--
 libdtrace/dtrace.h         |  1 +
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 51ad3b55f..938c5784a 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -27,6 +27,7 @@
  */
 #include <sys/types.h>
 #include <assert.h>
+#include <ctype.h>
 #include <errno.h>
 #include <string.h>
 
@@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+#define USDT_FLAG_UNINITIALIZED	0
+#define USDT_FLAG_POSSIBLE	1
+#define USDT_FLAG_IGNORE	2
+
 /*
  * Judge whether clause "n" could ever be called as a USDT probe
  * for this underlying probe.
@@ -239,7 +244,53 @@ grow_strtab(dtrace_hdl_t *dtp)
 static int
 ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 {
-	/* To be safe, ignore nothing. */
+	dtrace_probedesc_t	*pdp = &dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe;
+	int			*usdt_stat = &dtp->dt_stmts[n]->dtsd_usdt;
+
+	/*
+	 * Some clauses could never be called for a USDT probe,
+	 * regardless of the underlying probe uprp.  Cache this
+	 * status in dt_stmts[n]->dtsd_usdt (pointed to by usdt_stat).
+	 */
+	if (*usdt_stat == USDT_FLAG_UNINITIALIZED) {
+		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+
+		/*
+		 * If the last char in the provider description is
+		 * neither '*' nor a digit, it cannot be a USDT probe.
+		 */
+		if (lastchar != '*' && !isdigit(lastchar)) {
+			*usdt_stat = USDT_FLAG_IGNORE;
+			return 1;
+		}
+
+		/*
+		 * If the provider description is "pid[0-9]*", it
+		 * is a pid probe, not USDT.
+		 */
+		if (strncmp(pdp->prv, "pid", 3) == 0) {
+			int i, l = strlen(pdp->prv);
+
+			for (i = 3; i < l; i++)
+				if (!isdigit((pdp->prv[i])))
+					break;
+
+			if (i == l) {
+				*usdt_stat = USDT_FLAG_IGNORE;
+				return 1;
+			}
+		}
+
+		/* Otherwise, it is possibly a USDT probe. */
+		*usdt_stat = USDT_FLAG_POSSIBLE;
+	}
+	if (*usdt_stat == USDT_FLAG_IGNORE)
+		return 1;
+
+	/*
+	 * If USDT_FLAG_POSSIBLE, try to use uprp.
+	 */
+
 	return 0;
 }
 
@@ -271,7 +322,8 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
 
 		stp = dtp->dt_stmts[i];
 		assert(stp != NULL);
-		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+		if (stp->dtsd_usdt != USDT_FLAG_IGNORE)
+			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
 	}
 
 	while (prid < dtp->dt_probe_id) {
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 0f716cd40..f99fb5b6e 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -151,6 +151,7 @@ typedef struct dtrace_stmtdesc {
 	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
 	int dtsd_clauseflags;			/* clause flags */
 	int dtsd_id;				/* index in dtp->dt_stmts */
+	int dtsd_usdt;				/* flags describing USDT use, see dt_prov_uprobe.c */
 } dtrace_stmtdesc_t;
 
 /* dtsd clause flags */
-- 
2.43.5

