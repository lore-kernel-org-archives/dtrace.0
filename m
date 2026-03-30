Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B25274FDF
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895429; cv=fail; b=bCdiFgJ6gpoh+ziWs4lrlw5JscaXEQkq+yAMQAaCWnjSwCWuh5QstMker0cMlpMVwgj9xTdKkgNlG5M5s0hLKzSmS1jwPYXYgdVafsafgyIYRwjAtdYwTKfFQtaASaBEHfwgvw4UP5etihqO18KXCbgHYFLXwuI7wOyFC+Ki1Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895429; c=relaxed/simple;
	bh=VilkeQcco3TdmbimC5RyBrzLfqNQ4xFM/bBHt4b9Jqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ji+FSnqV25qiik7bWFoQo4yus5hCxn4evIcfsSTVbUAY7AmTj7drLtm9+iXdJLC9FYSPrUa3wcj4LoavuSmJBnvY0PZGnLfu1E7I+lvG+CYQHaYAyHMfyDl0lxVR9Ykl6D6z01MFBt3/zAe/oz3HaAQsq1gS54W/1K2Uyctyq8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DXfQt/rf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R+v3Zw+P; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DXfQt/rf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R+v3Zw+P"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDE6bu1800706;
	Mon, 30 Mar 2026 18:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2peaUuez9criu1rpRO
	AvLiuSXqUNzSBftW5/MLUUCak=; b=DXfQt/rfk1HoU8MCpFA6Ff/fd6IF9zuN3g
	IGYm/ttII9RT4exSuyxM1bbacyHBx9HUVcnWtc+abfixbhle2nlxCb22WQxCnCcx
	yCqq3JGAMBSu/KbLvUmy3ZQBUgn4ZJqqAsUW+OYllzqscTjp5YZpeIbR9rhAMC3O
	fBR2aHK/Ncacu4IjkprCICzSyd2Z1fMcp/IaUctcJYtr/y2MFVQhtl035NNvKQL9
	+JF8atTtI7gYrr8FRB6B/YfSAcFdSweSqAI0k4Ll0zjqfYZ2BP3aT72srbJzGXb8
	OJCEYXV+G42pfsyVJRQQOqhANno7+c8JGvCZmkUH93Ywgj1568Jw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d67hqasmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 18:30:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UH2ngb008149;
	Mon, 30 Mar 2026 18:30:18 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65e8w587-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 18:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BP/ICh1vRsOiW5KmLonWBpTnkihnLnPBkJw6eEf/7UIsCTgMH6P8Zkl2ECtupt8LaDUdqi2B0A2Ro+M9tiIXEqyl2G9UGrn/MeaFtDeF7DkypZtTcfq+zy6Y3jvteVKyi6DwOaYxe9CYo6bV0SZHzTSIW2RjUMyZqMV+YAOD6xeEY0U9xhIqzVezL5YXt9D6TSNEDBouPXfiJJGK3c27JWDp4lmWIo5+ocshAWm6A+OkCcoYonIfwnimYjai8r1PNVl87Bjq9otnvynzAenYVlTw/6P34wjTqeL8KU8X3MJ265EGNH3dGjCF0zkSjY0FFpSDrkrqXEGojP/0zn9fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2peaUuez9criu1rpROAvLiuSXqUNzSBftW5/MLUUCak=;
 b=I+QOCGbLNFHF6h7rdbqap9Tfu+zdxF4+6o/Xih26UoGeU4i8i47JqYGN+mk5iVtffEGfynONYRE/ynWsX2rZHl3oRfIJqp10kDtm0lRih0L3VTcjSXQXnlGAGZLC45ohKZSYQ0lcK2H07Bmd6LJq6WbPAbWTHKcbM7NMVeMinT8iSCBrYuKOY42wUnDNZErl1kTdvweStStlkF2tBEvKgC3o4zNg/Sv6eDbSgCo1SGBQJMID1AvAZ1Q5glA5lDKbr3p3oR3X4vmE8kBL/iNBCUEpLD4imU1YrwGQut7BqMP2earyYxr0dZBoxYgwO61ebXzELHgMW0IjUoEHqe97gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2peaUuez9criu1rpROAvLiuSXqUNzSBftW5/MLUUCak=;
 b=R+v3Zw+PnwtLZEIjN+z0tzd66Dcpsc8st4hABjbLt2Kbo2nkZgo+Ao1/vfPW4xyCEXt8H+5QULWvFfUwH/lmBEzWFLnxmrwWhVd+b4aitJPUv8SynQEO3bt964Z6UagfIaSLmDBoLCrJaz5RpcWvP2xcaluLK18NQJJO9lndGkw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BLAPR10MB5092.namprd10.prod.outlook.com (2603:10b6:208:326::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 18:30:11 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%3]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 18:30:11 +0000
Date: Mon, 30 Mar 2026 14:30:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: cornet.newest_7d@icloud.com
Cc: dtrace@lists.linux.dev
Subject: Re: Running DTrace in container
Message-ID: <acrBMandGlibnH8C@oracle.com>
References: <1A79B12A-61B9-4789-BA80-04F98DA80121@icloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1A79B12A-61B9-4789-BA80-04F98DA80121@icloud.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BLAPR10MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbdf032-61a7-4d1f-9504-08de8e8a609f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dXd7quuNiWrFCMSRvp87b+qV69u1yO1p5RG7Ei3ewv+rYYDjpixDHelqv2Ex6fU2ON/ZUvxU0oFkglhnfGHyci94IXawFTYptlhpiT39cr+CXkm+cLmFCNmi95dUIwImzArrXtHTRQ+wdEtJ7VjgjxZO4yV/7C75IXNQay3Vm5/KUTz2ty7EjsOj5VUDG9ZXcb1zEDvB2tbyGom3iSp5+fbLTC9NDNlvJjhe88pqN/EsmzKdB5zpEIZOg84joXmj7DzfruLMOpPbjH/dOeoEWqb5PLNCdvboQN9UY249SkG55YQBUZVwdeK/+9W1eyicK89hNI/65msM3GVik6sGmBeEWl1/mhRGqXN9MiF4jPy14gZD4M3Wc76aRJPRZMUUFeVQpAy2+2DUlY6p2oKrNhTieRN4av9qsMI0fPkCb4l9y3oUxmTjJzP1XGuMAjW56FXqUriBrByNxmiX0LA5cX5VTXyVcjIxKzLxVwibb7Hgnuen3JZg+aELK02cVFv7SNeIVzdgHVAM3f+hkk5ZcquRVAx+Rxu228ewY54Uhh93TfZ8h7MQocp7eVSfxba/Fhlf7TdfENYmjnslHLPwxd5p0nuujdVH21OeCxL8F+fAEaZoPPDM+Uy2X0zUX5Iz2+/MTFkXjZ4tOvjMlWVC+kC3ZBIwaMvc+rFcb8SrgsMwS75hC58hETILflz64lC5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pxcNMOctMPM70c5zhNzENfWNygELrAT2p/lj9QyG48IEgJX2J/7BWqm0fkKF?=
 =?us-ascii?Q?+hdSIsjxIyAyBZk44CI+cLQmMoh4IU2OlYX0eY/8ZEd7ckDsTH3m8+Ppdl09?=
 =?us-ascii?Q?t/T1tInF3M61dCX/t9c2HtYI2GYFH8a7fxFYxO32A5DTY3SIicR5o8gtlLCK?=
 =?us-ascii?Q?6S1hwK77lcrdX5oi0zLcFkzUvUZQMJFrUASIq+hbF5VS8mXNuAYqZbX4JW3z?=
 =?us-ascii?Q?L+DibyjFR5dP5WI4LqwTdHSPEFqk2KzmcdF228EB9i02PeYcn1fGW4SHlu5c?=
 =?us-ascii?Q?8lexY9ponWb3TRE/Hg4x3M2xzzwcBv9ca/ikTFx12Pa47hfBkDj59J0QIy7l?=
 =?us-ascii?Q?jjLaA1b54DdWl2SPHFQDZXCiqR1Qum6Hjmh8xswtlx04Tn+uGSs9smnJsNNM?=
 =?us-ascii?Q?LQNtqxan5iPWQ3V7Iuo2j6VALXGqMfilsorFoYqVUgknKPYaBaEZwLMR9/x1?=
 =?us-ascii?Q?qrHF+xWjYkuO/uOtcxz0mulUYNm9SXJ8et0M79Zh8enn6SkVugbztqEofzMG?=
 =?us-ascii?Q?ajnyrwHDET2W3Qi2Y/I6bAILOHKfciQcXgyKZYbAD+nhT1OpveB9UdZ8ozZd?=
 =?us-ascii?Q?UFR865Y6vBY/yohhRLLveNywcuXQgorjgsXiqv3pz+NTFi0EUmabfY9yM6jk?=
 =?us-ascii?Q?OzoMIdVEEvuj7LVF4U3tj7AKRTzEQe84W1xKUQZ91cPjySNXzClauJATFIRY?=
 =?us-ascii?Q?K1pritz8erC6qC+WylVb4ePCH1z8+mPhAO1gyRFLHv/dbkNkqgNsu/eZv7Cq?=
 =?us-ascii?Q?TDb2y5XN42A+AnxAsaoQT63awhuICxTTVwOA6AMAfIrVDgj+14+j1LN597xW?=
 =?us-ascii?Q?DXcpVUZvf/ReqOHpuhMktKK9ga+9g4RlL1QOUpRjpasbsD6EWp/dEGn3/F0Z?=
 =?us-ascii?Q?PK4MT6smYnt5fYwV2fOEu5tQI2/tSFq7J7KwctfVKvd3OFaWocJ5TFD5KQAO?=
 =?us-ascii?Q?ss4yLjzyPMzEO2l1XUudWxTtquZ/HfTzMbbWpSPt11Fvw6f0DGF0wLVCdW3x?=
 =?us-ascii?Q?Lx5tUUdBB/Tg3iXluGRRQgcC8Y89Jfx2d5vEPHSgFc7bRzpkKUlGyqBULnxI?=
 =?us-ascii?Q?Ra0oDRyFWxNwPofO1PAGqKb6fShD1qLl1NhSh6GWpxFRjedWACNBXY7wWH4G?=
 =?us-ascii?Q?LcB1Uxqvvo9CvFcJwMj/Oq8G5ly8/l9JXzIrkvC6f3uATbeN1bxdg9ZxDtmD?=
 =?us-ascii?Q?9Dvjgcd7pYpfoklLLS+Q2TyAUl35gCFwyIENpjSN7BdfPTqU8CWJGI3puVEc?=
 =?us-ascii?Q?U+9IQryBs5/TruWYY9h/KRLRGFOBMHWjI9MNF8jAD6KWIdxU/9i/bQFu+FXy?=
 =?us-ascii?Q?mzc3WTvRneTtEn8IOPTE+67+CoSLXE6xaVi9aCdydiVsVSCwtKHpbIRMvi7p?=
 =?us-ascii?Q?DHZb4AMEW9oMwNUPX8WAjlC+KJ1z4tD4/6I7T444XKGt3ZAmrTZvlYtBVS4x?=
 =?us-ascii?Q?pJJR0dcoIxVfIi+QFEJbAnYqSJ18cAfpx3FcqhH5XmfxbF42NmhtqrEwi86w?=
 =?us-ascii?Q?dWnyiOzfedESK9//grd9egoU9L8dWWM6KCrfD8uf1KElAq0DjAySAGVZ8h2S?=
 =?us-ascii?Q?mAwJGoLwTZxU71rwO46QeQ90Cd1tdw29cAUbvOghiohCs8d+z3dI0S0KGZUQ?=
 =?us-ascii?Q?PuMJvs/K2nr3kkUbbt+gQRW5/5bgwq55nD5dNfpt46apY5X6J4yhY2Jfcn0n?=
 =?us-ascii?Q?8nwlZ6uV5HHtj+uhk1UYaKdT85WtHJAG383ERKR2scWwlvwzHvjF0eUctJoD?=
 =?us-ascii?Q?kX8ENxwXfQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cpLaOjylZh3b0VJRFKYRu2iZ8dUFM7WbFxhEFrVbMRH1kIEAq7LZqZMcarG9ovbpVxtF586sHxGjKvHKtRqK25Et/WiPsw7W6x+10kryDm3iITkgg8PdgB+c1D4QLdN/1B1z1Y3L2+10fYIuBBVPfUDVDNplnK/JBzF/IvyaHe+viWYn4gMK/zNshALOnF6cFtAv6mlbWcxDzdCi81JqR1/nsY+YgZtpcf4NBalYL35m/iotFLznPmReGCbLJF9gYAE6uh2PDf89TtFmk3FPtl8BSV4flfveEX2LHc3PuT5QvWGRlgz0W6mz5gg/WLxkSKBIiv9QYhhQCB2NTKA3Tg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fr3FX5KQfLrzxNqM6FIs5M9rkqMdPkdbr4Oq8nUlQYtKhWZhqucibGrHH/a7dm4JUVII0Dg9mOcYjsA0AAv8GabM4VmqeJtSRYTSE3Dw8Gn6gmrYIyDFRSMgIJR8XFLNj/hpolzMjaFVefcv4prtmuKYcu5chwnc+HPN18ELmzjwqyRCnPzOlgeVJ9UuHsuIQQqUlCZ3zdM4C0/8mVSVSjFriKJ01yTju1S4JG+8N1uYCowYy938aMdrLZS76oddenu/JursQweCuq3xLkqaISezEaJUkKhHCoEI0OkfyjbO5LBTZnAtzgEI6cUglw9PVcKmhHhoXHnjqFEcPYeTCO8UWWp33bxkIR9OoSWlnPVsI3pUdUL7w0XSb5SoBWt3Bczm9dFk71IDxg0kBhud0ua9t/FVCFws0AhvVPiy1DMG8r5IuSVIRvgTTjbSd5U0aGIk98zpWqKwXa7GIOvxn+M6nE5IxlsIERBCsNB8tjnPlLDalHxqyOYNEm/xdGFZhfSG9C3c+vUa7OTxxihYvMPMcILBeeg/Vd0bSep0DA5WrIrykAaIfxo1UK6YGx6HZKdMzkItyq2qJEqXvyfeKd9rYcGFOMxwtWU6yKpGyb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbdf032-61a7-4d1f-9504-08de8e8a609f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:30:11.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfYhS6O8NYxgHW4GIjEMIKz7NSkbwIBgwpAv/xdbEvxbYOLvakFAWVawYmqNZE/mTSm82eNMrioN7l87e6UQDY4SHRG0KjyE8k0n5iqzst0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603300153
X-Authority-Analysis: v=2.4 cv=T7WBjvKQ c=1 sm=1 tr=0 ts=69cac13b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8 a=DybRN5k532BYPLiXgMsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -t744JOcvvZ-PjjRmXQRtOd0XfXLiaJi
X-Proofpoint-GUID: -t744JOcvvZ-PjjRmXQRtOd0XfXLiaJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1MyBTYWx0ZWRfX5v2ksOAQVVOY
 LWEZoWW+choABm1brIBv7k28ReWet4faPYqVlOajMNjMJBwXd8MTIGu10dLY+MxjxJV9TNeJ7oo
 639PecS+qn3BTt/jCUlEqmbms8/wq2otGV18Mvl5z0+0YM4Knq1mkxW2OSRKYU4GjjhIBISA3yl
 0X2fIAXsG4vMebU5FpOTDagIdhvyvWST20Jld2/uG95GCUQ+sKdxv/O1+RbKk3TCf4BilVfCcB+
 zsl1klkpRht4bYCqSe+BZGkjTWXZf3/LR73HiVz8hEtiaFxgQLTTLuGKQUuS6LhJk4hlyU+t1bk
 07cH06/x2KEL2y05Yi58KZWVqeuRQSdkogVuJx3xzSlerdFV2AHYSgfwBz3zC6LAJmR8WnKlrg6
 jgsBnrSeezbo4OJoKdlfMPeP97w29LHrf8+KiDRMTuZOkXbc4znB8/KRM9e+ZGyjL4lmyA4OxVT
 nHX9DuJ1kfhL1+OsWKQ==

On Mon, Mar 30, 2026 at 11:27:21AM +0200, cornet.newest_7d@icloud.com wrote:
> Hi, I'm trying to run DTrace inside a Docker container but I get an error from one of the bundled DTrace files:
> 
> $ docker run -it --rm --privileged dtrace
> root@b72fbbee0b66:/dtrace# dtrace -n 'syscall::openat:entry /pid == $target/ { trace(copyinstr(arg1)); } ' -c 'cat README'
> dtrace: invalid probe specifier syscall::*open*:entry /pid == $target/ { trace(copyinstr(arg1)); } : "/usr/lib64/dtrace/6.10/procfs.d", line 131: operator -> cannot be applied to pointer to type "void"; must be applied to a struct or union pointer

Thank you for reporting this.  I have not been able to reproduce this on any
of my systems (not using a docker container).  I do not see where the fact that
you run inside a container would cause this error though.

The offending line is:

	pr_ppid = T->real_parent->tgid;	

a part of the psinfo_t < struct task_struct *T > translator.

> I'm using Docker through OrbStack on macOS ARM64 (so this is running Linux AArch64). The Linux kernel that OrbStack is using is 6.17.8:
> 
> $ docker run dtrace uname -r                                                                                                                        
> 6.17.8-orbstack-00308-g8f9c941121b1
> 
> When building DTrace I've based my Docker image on Ubuntu 25.10, which uses the 6.17.0 kernel by default. See the exact Dockerfile I've used to build DTrace at the end of this message. I've also tried to build and run DTrace without Docker in a virtual machine using QEMU running Ubuntu 25.10. Then DTrace is working fine in the virtual machine.
> 
> Have I made some mistake when building DTrace or is it not expected to be able to run DTrace inside a container? Or is DTrace not compatible with this particular version of the Linux kernel?

The first thing that comes to mind is that you are configuring dtrace with the
--kernels=... options etc.  That should not be needed for regular building of
DTrace on supported kernels.  Those options only come into play when translator
files are to be generated.  The provided files should be sufficient for all
regular upstream kernels from 5.2 up to the current latest upstream kernel.

We support those options in order to generate new translators when a kernel
change occurs that causes the latest provided set of files to not work with a
new kernel.  That is thankfully pretty rare.

So, I would re-try with building dtrace  using the following configure step:

	./configure \
		--libdir= /lib/aarch64-linux-gnu \
		BPFC=bpf-gcc BPFLD=bpf-ld

You also should not have to download the kernel source tree or anything like
that.  DTrace should operate fine without it.

> Dockerfile:
> 
> FROM ubuntu:25.10
> 
> ARG KERNEL_VERSION=6.17.8
> ARG KERNEL_MAJOR=6
> 
> RUN apt update && apt install -y\
>   libc6-dev \
>   bison \
>   flex \
>   gcc-bpf \
>   binutils-bpf \
>   libpcap-dev \
>   wireshark \
>   valgrind \
>   libfuse3-dev \
>   \
>   libelf-dev \
>   make \
>   binutils-dev \
>   libpfm4-dev \
>   libbpf-dev \
>   gawk \
>   \
>   curl \
>   xz-utils && \
>   ln -s /usr/include/ctf-api.h /usr/include/sys/ctf_api.h
> 
> RUN \
>   kernel_version=$(uname -r | cut -f 1 -d - | cut -f 1 -d +) && \
>   kernel_major=$(echo $kernel_version | cut -f 1 -d .) && \
>   curl -L "https://cdn.kernel.org/pub/linux/kernel/v$kernel_major.x/linux-$kernel_version.tar.xz" -o "linux-$kernel_version.tar.xz" && \
>   tar xf "linux-$kernel_version.tar.xz" && \
>   cd "linux-$kernel_version" && \
>   make mrproper
> 
> RUN \
>   curl -L https://github.com/oracle/dtrace/archive/refs/heads/devel.tar.gz -o dtrace.tar.gz && \
>   mkdir dtrace && \
>   tar -x -f dtrace.tar.gz -C dtrace --strip-components=1
> 
> RUN \
>   kernel_version=$(uname -r | cut -f 1 -d - | cut -f 1 -d +) && \
>   kernel_major=$(echo $kernel_version | cut -f 1 -d .) && \
>   cd dtrace && \
>   ./configure \
>     --kernels="$kernel_version" \
>     --kernel-mod-dir="../linux-$kernel_version/" \
>     --kernel-src-dir=../linux-$kernel_version/ \
>     --kernel-src-suffix="" \
>     --kernel-obj-suffix="build" && \
>   make BPFC=bpf-gcc BPFLD=bpf-ld && \
>   make install && \
>   mv /usr/lib64/libdtrace.so* /lib/aarch64-linux-gnu/
> 
> --
> /Jacob Carlborg
