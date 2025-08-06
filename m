Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FA1FCF41
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523233; cv=fail; b=QL/W8MayAKZhVfWIQ4qHWmz2vPNVe3tY4ygCliprNxfQxHj9ysoB8HbaK/wmZMPl/XICsX1tQVun7yXPsMzKFuzeCGm0apcJiCMn/OzmEMpsLueaxMNMDVsBbryxLTIbwbMo8tTLbRBGd9kSgv65zmeoweYGMeQzuQv03swwvOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523233; c=relaxed/simple;
	bh=yX+oRnbEgc501T2JFAWsMkIT423+OHMktrs4V0ldItA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CqwMznp+O7zEQJwRJ9MzBMZF6tn7xg38OKzoMPLh8jQJDV31cgf6ppvtV6X+5hNegKL3laaSDh15A0pQwPGSespn2Vb7lEc8cX5W0GV/umvOBFW4yNrUCfaWxMtRv9DUgXb2T2Q7dPDVtP96mGAG96fBAW0KJH0kgwVgfylHDuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=albMslcj; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oLihMAh2 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="albMslcj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oLihMAh2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576KRUip024116
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 23:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xs3+5cTpGvaywMECpWrAlJ7naSn+BpBZoDGomOci9xQ=; b=
	albMslcj4zk8M467kBqxFXjig4wVJfdx6+Ufm5AeQ6R2emP8UgWccQg3ZsdaDoPD
	jSI2dCYJdsW51uF3S/isqwPxiRVyZAZ+fdDnyRCD4Im/fIUqqqreFWaPggyQ6Ckr
	yaenOMbco1y7NmWzi5dGZdsRAgt7/znYeUNCGhFB7dPoYAHGcgLY10iuaqklNS+E
	IWfcbZYciU+xdOzb1mFADfxgQgBiJUmtBMGIXHBvbXeV6HOh6Z+5LlCWIrX8gvWL
	/oV4cQ3AD0ZEYOCKxwcy3dF/gpr9BZHChh1yoVut/4qgfjqo4FofNVPi1KqcVA2d
	bskPhLmmN7qXlAwUrp3Cyw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd2w95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 23:33:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576MN3Gl018510
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 23:33:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwrpcrs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 23:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy8oViiKT8FjLpn1iggXLITZ7DJs7MyWlPmdl4cEB/sUiaMYwHW2+PxCQfT0eG5OqLA61ilZ8OAPI2nsdqQcnXxxbSy46h0pSnVSD2bFiAlnEofe4ZXm9yXGae+kf9WOI6ZdzCmYONn2R+yizSXWeZVaHJtrzD/E5LvyTIL8d5Y/3+IxTohgYzJi4QEzTNzlhPTncrzQbHpmdocMMnrgQ+n6Hg4Ts+ko6w+tYpVqO6ShYoKLL5pWlyFChG5g1XlkkUUYovSmVnyaZkFKdGh3jsE1GzIkJ4MdpUd+uuaNY0VyYdEGkmtUYTainlvGn3qJlv42NA8yCBjdPqVt6FLC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwyAGy+O2aDsEGyoho6i/h10xk0gIlkuePOhRMZQNp4=;
 b=K0XG51D4WATajUaDFoJxYpCjGfy42+OUOWYy1IC7+TC7OkWQgqqgkUZfhFjwVY89f8oaxeA4Xe2kZ9ZCLAH0fBVu4kvGaUYW2N+PJAyze/bI1JqX1bpYoOMTH1m/sY+H4hyQgf1YPOVBg3rqd6ykXZ1GE6bVFxGwgAtVoaHGvVERRTdHXg7CBBX1YO+Q1E1pOBgHCY9j+p5CnltT2wtoTNwC1SgfRXz36jMSPQJ5/uk9lTDmsrzhrlQfZ1VF8pj8a4bS9hV3D0g3TqFU918dUzYkBbx+rtA2G3eg/ANUxE4Xo1Jnv/fdLIQr6NzuuA08GvtPZZ/qmFZAzKGvaaRqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwyAGy+O2aDsEGyoho6i/h10xk0gIlkuePOhRMZQNp4=;
 b=oLihMAh2qPczgCdC1HqJKO8bXY0/1Y055PXhbZBByXm4DW9Bo3CFamEn6MwVMS2opn8fck67efp76MuLclk28BxRFVOVb5chN0Rr1gkDFI7yPZ8jW54mE5Zm9D0tYCBrqeMaX1y+51lEOLxunm/UQCm/Gx3BL54xgrbnPUGoIKY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB7254.namprd10.prod.outlook.com (2603:10b6:208:3dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 23:33:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 23:33:45 +0000
Date: Wed, 6 Aug 2025 19:33:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] vars; ensure 'cwd' and 'root' work and test other inline
 vars
Message-ID: <aJPmVjXFp5PTwtMD@oracle.com>
References: <SJ0PR10MB5672DE6507A2E9026B67D8F3C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <4768c6ab-2b0a-f21d-85c1-c434d25adbab@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4768c6ab-2b0a-f21d-85c1-c434d25adbab@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: a9700410-dc51-49be-010d-08ddd541afee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?t0YdyDcnXPV7ZFOpugB7OlwosE+84bWzpeuUbk+5NlqnDS12jbi+A5OMpo?=
 =?iso-8859-1?Q?po/DvUvqQOi2VCOgYAvE6dTLKlmZREa0eIzf9ktdBMSdZH8x9U7TA0j+I4?=
 =?iso-8859-1?Q?Pt7IXe8JoUDNcmaAp3zdavUZyKXZv8/D56GhNvHUvGs+sHEYPsUo2F9KnL?=
 =?iso-8859-1?Q?iw2KLEyPzVeYw0T3px+md+pRfiIgeGqf2YsACEm+ONniA9bj8PWzrnREOO?=
 =?iso-8859-1?Q?mE5JVw5s7fy0416sJQ7XMv0dSdNwn0sK1HZwe66jo9gHdSEAmx2SI77kOj?=
 =?iso-8859-1?Q?XCYxsU55jbDXKso5afQPy2vaReX2NOLgxQLLjsM6qWZZ/qos0z36io9AHK?=
 =?iso-8859-1?Q?f6snGvlbqkYuAQE0edTNIXB4nNhCqmQIO2Zrh5o51mjl5LUUM7m50lQ41D?=
 =?iso-8859-1?Q?VRWSWdhk8z2l1040Gv9X/9H0T6Bop2+v9toYwWp4e2bO8MFr1nhcFfRGg8?=
 =?iso-8859-1?Q?Rq4g2aSaC7TDVhyOxdr5A0+8oRTkjObbzB6iil8p08C9fEMD7jL0cl68iE?=
 =?iso-8859-1?Q?SvUVq4zlv8Qa3c+TniiPrr81IrYW5+fafOQn73FFyaPnG4R8+e5ESXsBwM?=
 =?iso-8859-1?Q?jJ9qaUgx2MjlglBItBu/8UUIeg+T/kVw8wxl8fEmBrXwoAit/3KMnGXaZZ?=
 =?iso-8859-1?Q?aPvHfV2DjC/k7S/PZmQIO932ODkingtUECvsU/Q3i7QZLfCvui3pElhUDh?=
 =?iso-8859-1?Q?N9LhntbqqiII2lkEaEnP4JQJi2oXtlII7SfzBb3o3KqHn4gfep2CsVz0iM?=
 =?iso-8859-1?Q?C7z/GeWq18xjOE6WW+15jDUUqarztyqD9uqaxRT7FquPKfL7irXSFC2CW/?=
 =?iso-8859-1?Q?u6d5dPfziemdhD5SWxrhuYA2TktegdyY4/chzDxnwR6tP39D/NtIe7mq58?=
 =?iso-8859-1?Q?ovEYuNu1426sROLXLMwqP/6KyL5mwtgd+bbmivKSBTgH0N6t+U3zkNzDLP?=
 =?iso-8859-1?Q?639MvjSZVFbet0a0pl+x5LmVV7B/2BF9tGYDOo+gUQPUHMJEFtqP+r31cV?=
 =?iso-8859-1?Q?pSCAygvgPLor/AKqvS3YjyQcV2Pso6b6Fwqw7ix6vWXXFzllTxriNZyEbM?=
 =?iso-8859-1?Q?YYZOy9inIEN/m94yXEaQ9RSuW4Wj9KxCnuGnUpTIhh2DEiS7uDQiw5mjsN?=
 =?iso-8859-1?Q?6kTtCrKdokYc/tuTcLjE3SX2rCZDGY3mZUKESnz80YpCQDsIKOw4IMyoUq?=
 =?iso-8859-1?Q?+3Xr7lNYQjHswIHlSQ10yB8mRIOi/adaCXD5/rkxemdppML3sSIqdhXjkQ?=
 =?iso-8859-1?Q?c/JEqeQA9Z5SG2639zsT7olf7s9kwVpgqF3Vle8yQcKOwVqAQT6/9xKTxE?=
 =?iso-8859-1?Q?SWN4t2hxmibt51L8+OBenPIqKfybYdGFq2zu+TPBAsyLzfI3iWtiWcurg2?=
 =?iso-8859-1?Q?pFXXc0bbq5wm42s1JgS3VNzWouxgo90sWRLSYuwpHmGGMJ2kYe3oNaY3mR?=
 =?iso-8859-1?Q?AfZfEvJujLxbVaXx9hFc+g0ae1ycqWdkImnTPD6Es86SkmFY5qTtSO8uuj?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RRqOPajIUbj4hJ83VE2LHf3up1Y4WKQiD3JdX8Uu2kZEphn87DouTRy5l8?=
 =?iso-8859-1?Q?Fa8c+Sn4C4SP50xTECURKS25QjyTh0FNJeGf0BVbhXS8KEvA2TvDVc9W/A?=
 =?iso-8859-1?Q?jT5tzbI4kwJ6MZUJSGaMLjw0mPVNJhfqDCV8TiO08fLm2HSxtFh1dAzdXv?=
 =?iso-8859-1?Q?3rbRaYdj+5dmH1j5vNhq/E8PiPKkEvuztZ5IlIUzhdN0LtOpoKgIYWnlHD?=
 =?iso-8859-1?Q?HNWolamiQxjOQitY4gy4mVzAxYidUFi9bA8zK8roulFD3HOFa4BFFoDsb3?=
 =?iso-8859-1?Q?Xfv+F8em421k/r7sA0p6hletrzcsR/idBh+IuUEZ5HefrpFFcbeUZYD00e?=
 =?iso-8859-1?Q?bE/RmfDGvYJC+bpNmgabVVO82/vg5HOH0HBTo3vLjWj9Mo4hEN3kalg9uU?=
 =?iso-8859-1?Q?hBNMGXz2WnEWyUPzuO02RuDZ5UYyrd5bFKQThMscWKUc92G5yb0kXaju3A?=
 =?iso-8859-1?Q?KhXl3zcxtJ5/SQBPVzPm0HatdGpM1MoCG02QhFnr0I718UdqLNxQxYwg9V?=
 =?iso-8859-1?Q?GLH8X9vIYq8Jv8TYGG7dxzuQFtomidpNZ0nhPIu/C/yRPPczKLKzazmYIp?=
 =?iso-8859-1?Q?fsf1O24gwZYFRfpwd/jbxM3qWd2AIZqY2Z4gckX+J0DtqwR8TA858/C3sp?=
 =?iso-8859-1?Q?GTf6ez1U6/GqVG0EmxikJpz73kKRxywtZ2gveWFodzGzqta4fObY47ids2?=
 =?iso-8859-1?Q?yNG30hB4Rj93+jr8uds3eOLBN7RFOIOrbVvY0aHor+HWNLVy0SfKzQ9BAe?=
 =?iso-8859-1?Q?6TrNswv5C7jb3yvEXRykbi3NapSZ4+mEQOuNwvQcMwTO0VtStpzrs4/O1p?=
 =?iso-8859-1?Q?TAHHN/hRF9NYto1j0Ikeqk9vRtpGIGTBX5ZzfQU2s0JSUGpu6zreepd7zw?=
 =?iso-8859-1?Q?DbD7cbjXLYTqmQwoVWImfkcPYbRjUVJ22+v0bhhtEdmAA3XGweDgCeRbyZ?=
 =?iso-8859-1?Q?nYOJP8FbJRfT5CLecOlARqhoYV7tRqB4aa9zDIgAylw1IE7h1oBUfjBDx+?=
 =?iso-8859-1?Q?hxTpuWtXmCSZZpScw7hHBeQyXPl+UR5yNmf9BaHoSTEQvB/HWUPXzidYOk?=
 =?iso-8859-1?Q?EdChfNo4fovfybKDyOOzE/SKMY2MjZZpToGRtf8R/cV4cAo8kNOypDypqj?=
 =?iso-8859-1?Q?Nt6cJ6c55f4zpt+wqLM0heeg6o/3IIxXRaMi2on3wMkpa979jESSr00C0Q?=
 =?iso-8859-1?Q?fOkhDBRDBov/WdgDt9eKHhsqYMkwLs2wnJEqQkU/YAeYeBsstkKLUFB69h?=
 =?iso-8859-1?Q?4xmaSEp+7OTNuCptu/ws+zZ7nwe174envm/OwvKVuAt+1ue6Yiqn24/AWK?=
 =?iso-8859-1?Q?wmdqrEAipiBwNl05LCIuFYZcLl561aRQ1CcKwZJ7LUm0z8LqT+bPFtWSgG?=
 =?iso-8859-1?Q?1Qzbr6RjQyCkFjRDKiC6no7zxp4xjjzIAo+lKQbNSCvIZsiz+g3+cezqgW?=
 =?iso-8859-1?Q?pnQmw2oVF0/oYKaRb9UvQrCaSplqI/bbIuWRaWBoqecSGnQze3i1RUYvL9?=
 =?iso-8859-1?Q?yr9MWcfk3sEnNKUs3zy03AP5POkxT+R4Tr4eQUAxX18JQY94jyAHUs1PgZ?=
 =?iso-8859-1?Q?atHCJqZ7Mccr22d1QXvezecsAYCSz7qgAsOzNzteHMGin0BNKQh4KBRNI4?=
 =?iso-8859-1?Q?+SU1nTGaiXcT50gGJk0dZZR/PxZA52qG/DkiZ7AEv10oT05WjHRcdkog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+jztOFvhxCk6NWpLEtD2830QB2lCgwN3zKSdOQQX9AjczHE1zmOgr7B7AruL03btcNe7P1PLlGe+LIGPHRnSEe4n5S6iL0ZXBDF9+5H08K6ejxDei2/VOPlrD5L+UrT5u+SCt9E8igYmh18QCTbopUWsB4kGVMp8eKr+4zkA4RoFIEf1X+xcGRhbKW2o2yOSUhJpXRgXPJtSSHaWbePWkK/AAT5j09a06PrzDBPcKa6vX21BfISKnmUvhCXr0+mFM90EppWiqdoe3qzhQ9OJ2mb7Do3dclepkBV8csBCBXJlXsUVdIAGHHzWaE+P3f19FQ+ZL1Z7V4coXydpMLINaYcoH/zr4MlGZZzLtQOaGV9LgL28sBDl5J8OVK+pfSWPB4vF1Qn3yPnInY1jRzOR5PhilF+dj1dTRWN6isNy2mFqH0/DVeowfqeeBPV0YUjfrYxkQ0gvu2jdxx3iZo0xUuKv6GupGlHD1QPf2Ef+NuUha/5yz9jFL2o+UvV5YfhybprZM2ek+vzYTAB9QXo9ypzVpiIVy6UxyxvYCFp3GAj5BoU0gGySH+Oew2Jw/4fR6sH6WdJ29iUqsnJSCSGSVGYmPId8ZXHFJza55nycwUI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9700410-dc51-49be-010d-08ddd541afee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:33:45.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ko1sBSnsi6vVcO1Hp3ZIWbLXrYO+n23aTNoFEIGtlqiAE1AkIo4/GcThEWq77CfGJ1mOmVSYDmemlJdeq1xo3biV2dgpIzFPpUkSFJYeRPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7254
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=954 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060159
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6893e65e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jAA4ja6ovilogtWiEy0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: --TFvTJV5Ijs6t0LJdM_2neJG_tHUACP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDE1OSBTYWx0ZWRfXx7IZncHEXaz2
 4F7dqj7jWAeKvUsnbU3ry0h53UgaonucoQfncgsh7TXcosHpGgkvSNrwSaCpShQUVhb+J5L1F+8
 gs+cE6S8N8QKz9IOr4PGtqtcgXyTK9OEYJ2YE+37nzfzK4tud3AXe4olVdW0ssU/re/JlM82KSi
 lBvx1yZbbBIMRJ0cDsfd91n/4yTSQGQUS9ZNQp4Y4ngbsGyA4LuxRyyiQ053o/FnQyNjITjWwx8
 NLIL09+hib2eZOh2VtodUSNm6O0wTm5uR+nbOnNbLkydWfjk4bp+qQ1oKBogsIZbPwWQC4/hsc4
 yiDyriJvNXgfPDI9xiS+aXloKbPRd89qVzeh/3OSsSxn9BGVI8FFYd1BunceLxI7f7kSdM4TzEv
 ZEc21BlpsjTOU5ji0sSid/Qm4uOBdDqAD6fuibFGZGzVgGPAYLO4t90y7plC5IkyFiUs9kA6
X-Proofpoint-GUID: --TFvTJV5Ijs6t0LJdM_2neJG_tHUACP

On Wed, Aug 06, 2025 at 07:22:17PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> Should an Orabug: be included?  (maybe not... figured I'd ask)
> Also...
> 
> On 8/6/25 18:25, Kris Van Hees wrote:
> > +	/*
> > +	 * Copy the result into dnp (register value and tstring).  We need to
> > +	 * clear the tstring from tnp once we move it to dnp.
> > +	 */
> >   	dnp->dn_reg = inp->din_root->dn_reg;
> > +	dnp->dn_tstring = inp->din_root->dn_tstring;
> > +	inp->din_root->dn_tstring;
> 
> That last line should be removed?

Woops, that ought to be = NULL;  Will fix and send v2.
