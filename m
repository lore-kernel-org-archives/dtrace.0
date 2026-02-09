Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139883033DE
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 20:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669838; cv=fail; b=hFwIp+unt6BUaDmtUZcQi+Tv+EeBaqs/7AyLVwjzpnOYte/zDlFmRnGX3hEfqz/b3SX7jsOVxFWVSunpQzYWi4p4OujF7919u2vl/A9E3ASz6INNKP3Tyjwi+vHzqeoz0HHQYTmQo8STsPaB/gVTUoPuirITDJ37HhWnSnBgPPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669838; c=relaxed/simple;
	bh=xXzGjpSKeIvK/KO8+/pOQfJwvgP+h1emp8C2luoklUU=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=FDMUSt3QjTmu9E9pYiFvc8ZKlkwdy4Oz02tB2kYIFEZ9vl5tIXbffvYV4xHUZYLp8M2j74pNoZkbGz8AEIDcIziwH3OTAKzauhO9G5xyFUtZ8/83Wg0Z1PGVJ1ipPmVX9qpoS4Wt5fu7hBvZCg5a4oYZhsjkNHbPFbd5e2lx/x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q1XcB3bM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l/cye89c; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q1XcB3bM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l/cye89c"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECn571628192
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=; b=
	Q1XcB3bMwIyKmRV9dulXhTEPkxOIQqxdK/ezHjo1e6SEApZFIrf062AO3KQdX1d7
	DUY+PyI+rU9TwFu5sxIf0enARuqnFVwnu5coUxxE/o0mFFxKjlpva7Mi5Ou+MYtU
	xkSFXuRm2qPEV0V9mh2qhVEJ8Y/52nPHARmU2leZnFXeazbldO1dtGjP2NkTJOjw
	X6OaCHUAptdU8MFqK0B/bK6K01YM3wbOb/KbIZc1DF0K3R3GFrUNreYI70WDVZyS
	hnEqqp9Jdb+3S7EjsJqH3fX6bHB5fBe9GIAZzmjRJcxXW82DjgFMAuSxFNlknn03
	6V55oCiaX37ZsHtCAihoSQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xh8tqrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619J1qEF000438
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:53 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uudh8pt-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/AlggCUq9Y0H1RMVsO2rVRngcV1cN4ddm6x5ZtMDWRl6ulZCnb5XYQRFyte1/E6zBQJiQDQzePvr90jIY3rL0Qqe4nbPIYK/YQH8AH9IaTSIKps7rVT5wiPn1c78CaOaauHxVr+d76N1szNGZ11lKjsy/agr5gTeDSeUqYIUgxto+hW3+Yrn36NFAfzjYvr889DE4nr8IfBR6FoUj2U6nOHPdiY5sHWvQyLv4BiRqUCgbgBRT1PMr4290tmWXTtN54bkU1p4c7ycDUxfuqN0HKGrtk9tkLxiFmWFa3roLkO7o+WTIB51XWWtTTbJ1tLeGeazqXZ2LJlrob9cfGUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=;
 b=Eudmuy/orwvu1p1o8O0JKc/WjnKR3y8RY+qrIMzhwEGuBO22jmEPM/gkisSPtlQzW1zbvlkdF8ppvwVqr77wgh2UnjRFo2nRwQlLA1k8kgUknTvqkIq/t1q+iDydFWZOOy/0bOXGpq/D8RKBQlfwZh3xBNABbAb9sBlU0bBDEt9eN2aHavIsJ7nchyIIVBn+GPtH3sXz2Vt7gstXwFtd2H/uveHLTRA49qBda4mMYlbda4WZlUpf7gg1vHtPLUdVAZIJvOAOaiA1X0TszdCaN15VDrfjiP04qXWNr886wBpfDnepHQ2+KovzYlucEgD68UvrV9EpzCErPDrKMHj7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=;
 b=l/cye89cF2Xd22ymBgxMbODZVAMOmCi2Yq5Y5OI83cb9Y9TYEdJsUuhlu7zbu8ClYGW1BwmNbXeTylJROBdLvLCHxUkaTNs14VNblPMR/qghxqrYdLJTdSn5EFuwocJV+3rRTM6L8bhCUApW1CfHmwVrRpm6HPZeXt/vyJZ40UY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH3PR10MB7356.namprd10.prod.outlook.com (2603:10b6:610:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:43:48 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:43:48 +0000
Date: Mon, 09 Feb 2026 15:43:47 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] pid: ensure pid offset probes perform lookup with
 adjusted address
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522F3DF908967F8E1681F5BC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH3PR10MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 3091fece-5741-4ca2-d9b6-08de681bed1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BnbWA1x510xm81UT1SA1T5gkYl0X9PZqP3ltLoxBf/y48SXnrT84cVpoW5KK?=
 =?us-ascii?Q?jQjftIQKc44pko3N4ppGawQxh3UN9V+r4Owm1LDFBXQZvlK4O5bFCLsB+5RS?=
 =?us-ascii?Q?6crUTBLTa7rnML2kgCSJJj/F5X3Uy4x1+ZjIoQcl4od9cDtVM8LWRZzfe6B8?=
 =?us-ascii?Q?2PLXxXhiNNynLIc94bwG4Xf6as0H9Jo735/mE95VFXJFoGiOs+OvzZKvsPYA?=
 =?us-ascii?Q?2mM9Lhoy9Gv/MgFL323uHxaewoGuaqAkiycK/1Wheo23eakbusdbTVb6m6v6?=
 =?us-ascii?Q?QVod+PYtJavMPN2vVqHor0k2WNDQzXt52REQPJ9vAe75aIuw0PHu60YhPzUs?=
 =?us-ascii?Q?DpiFt5ZI8vMVGgB0up4qif63nQV8ZA1G6d9JRypQqYW9WN5v6E1r/TQbRcvu?=
 =?us-ascii?Q?6WBDK2poSlrtIeY3GlykLXoaW1OjmFfNMyEf9PncF0SlG/3DBa5VPIAyzUiM?=
 =?us-ascii?Q?5cLHVrPw8Jq/VenaIIV1Ma/xnv9liw9tKAlX6Q+6rgfi71l1QaCjMsI4K0oi?=
 =?us-ascii?Q?ulEJ6CckLrmTcj2vO7tntBNjOpVGsmfMJ3KGR3nMyZjQC8SWVi7Ho9sj5y/5?=
 =?us-ascii?Q?WCtwK3GH7oaKVUdt1PPc7/M9WiA83riK6rk9dp4Zn5YmQSanFBDFOdawNxQ9?=
 =?us-ascii?Q?2Z49mPXs1uajp8XXCPYsJGP/CmvSPlRxNFANza6DCZ4weJxxnxXolyqyXVDW?=
 =?us-ascii?Q?Os9FoLpBhcAX83iV4a9ypn7f1f0FUgtSMdAr3XAOF0ueYxV9YuqBN+mxhQGl?=
 =?us-ascii?Q?W2DQjDcinBdiX5dlGbh0xSb64Z4e8f/EDmP1t2ds40MH9+UFMgwrSJehpAXP?=
 =?us-ascii?Q?OmnlgrL/M3UPJtn6GV2UYgdsOanTQ9R7VPvanL4EvTZgWa4ngZsInZs5Ys/K?=
 =?us-ascii?Q?cKPGG79NYlSrhmzqMy+4RRsIWp7Qz/F3CEhxdnmX67vnzqFeoZchmXS/KgtN?=
 =?us-ascii?Q?uDI7Xpk4ur/xKzvyRcIopFHS29BdSZKJjySfYZLmpS+cExsQG3UwLXu7rmVI?=
 =?us-ascii?Q?yOneukgvmrBL5dhpGfTPY9Ll0d/0NFqO65kiEvjUjCm6gBi09EOK7KKnd2BR?=
 =?us-ascii?Q?bWrk+j9rvDj33PvIF+4p6eBbx1mY1k575YmA224NDf+nNP0KfybxP6sVeHdE?=
 =?us-ascii?Q?bntu+d+WLYKauduUW0q0IdIeX+CT050GqKXk+WBza/3uYVaEcwLwRjPVPv2L?=
 =?us-ascii?Q?xbr0dZkxTqishn33+bzmE7kU9AEJzvMz3HIN5YefWPxbEb2LiJ5+XfXfimAF?=
 =?us-ascii?Q?YzbU1m4ySGfjNIwLZREe5saL6ln0HVFK8Sa/cwCLbWpcFyYBBALpi0s8Ut4C?=
 =?us-ascii?Q?L0pGW8RcCk3D55We2LlgcgO3bolmLcpHrpQolu12JCz3HssN9WsQ049rZIXh?=
 =?us-ascii?Q?L6WMWC0r1VUIoaFrufpmVlOYrxRIqC2RD/VKFCjS9pCRlbQgnTCVGYY9VSWT?=
 =?us-ascii?Q?0a7pBF9cZ3sBzhVd4PDN4/8a2bOwOPZewmU70itbezoWAI+DZzf5btcigReD?=
 =?us-ascii?Q?x4fiVKsKazwQfxUHiQhhT5nK2T2ff7ZwcEF6URrL+WxS4ZW7na/5pOyJAZ86?=
 =?us-ascii?Q?/3LwdzPbmJL24JOkRxA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IHbB0dRDqIUshgfdccDuGzF22RX3tzSoN/y/jkssHOQzgmhD2hzWjVhHacMW?=
 =?us-ascii?Q?k8VdcuvLMX0ycutfdGed50XrKXGRfSx0FC0VTWSSt8YhkTXWUwts+xZW0uEP?=
 =?us-ascii?Q?klmZl/35nI6W7nsm9p6KfykKWMB0S/ptkWHVKg9bzyZF4GSaVbZkn2xGOMog?=
 =?us-ascii?Q?TxOhNm3g2+R6q7mMOeCIMk7Vm55WfOXJ+fDMo2ysuyk6srUYZiK7Pv8fO4D4?=
 =?us-ascii?Q?1r6Tk9xT8lQhMwteGgaiCYNRHb46VXoDVE6VaFh27B3pmnlDnYngZ+nhMMpq?=
 =?us-ascii?Q?bMVjFNBxmlM4oaoXcHNIxTa/1uIljeBemwX5VADthgwDFEk6VlSKhs9Ttlx1?=
 =?us-ascii?Q?cfTBTPvPVscsB8g7GiD0Nd3enzccp4l1ryHo0ab9UGOUOBNEdMgjhh9iR9j/?=
 =?us-ascii?Q?+cWPxIE2XFWTsWEfcF3SO/tZamVMe3GetCuyZfLZiUh3J/ndKZdwx/+mhvOZ?=
 =?us-ascii?Q?ggqJ7q3FLpo7aASAhtZ9a27XCjjXrVKcoZynNZy7GPzPUOjXImcSyV4mY+RV?=
 =?us-ascii?Q?60fMHf7C43ZLiTNVzFoR2i9ipRzFG8Cm34aLP9mjfFJSeD5feKJh/dF9c33w?=
 =?us-ascii?Q?CQF2pz3eGHpw0eWD43HMmpzvg3hXUiuH0mo0/5ZpP4BhbUdn5uzxNNOwAruB?=
 =?us-ascii?Q?TwNRv4M9yTuJRQ9E6/dQJFgZg/OoYDpumXIC4e3GKbP7aTTVziDKDywzzWVw?=
 =?us-ascii?Q?OXTpKffxpuPtkyHc2PJ4KxznPGK2ldlanpkE9UpPkM0xTed2CMUB/r3PMCd8?=
 =?us-ascii?Q?k37pwiTdbAX9uqCxcsBBOD6EaJCv193oMh4JJITpRw173jt4RSGQlXiDTyMz?=
 =?us-ascii?Q?SiKvHCMY0DpCsGvAt2UG+5FF9CVXJJPBG/PORhLc5dAC4sNjmAFEwysQfYC4?=
 =?us-ascii?Q?mF/gkCayuokuFv2vTBu44SSj62YH1dByR9jSKp2Qqp8Q8sSFFdQzsRGjmM5D?=
 =?us-ascii?Q?IkemUjaRlsXpQlKIMqUo8S/s7TBPw7Lt2ADiJ9ruws5RXoaWwakEW6QmxcsM?=
 =?us-ascii?Q?bL3H3fkWvoDFTtfcxJp8IlNEF/ne6hS0jur2A4gX9XHCp1M2qQrlWe2lM3nL?=
 =?us-ascii?Q?ZBtgLy9yPZqQ2ep6BT2jUjnjo8lCtnJpxIT70JIyHMNxeeKqQRSC6QdfHG2j?=
 =?us-ascii?Q?fN3oPNh2iHvx1TwLs3F569fqfVy+cFWro3SyCVGh79UYf3LOFRVFkHfAWeJk?=
 =?us-ascii?Q?D8ydrjnGgmvtvdP+KUy9VqjIccYBjI0k+kvdfF58lgeUPmhZLEFvJySGz948?=
 =?us-ascii?Q?THIUp3/8brVaQfiGxMKI8fRjmKXgR3N237CyYAV8sPsw8ISO4bW4VwvO0lZ5?=
 =?us-ascii?Q?HxB+MF71PLjUJiaw3mtTzPCcBmWT3qM98f/mAzu6OgUh51OgLHgBnloy691m?=
 =?us-ascii?Q?5vxk7DoDz3w917IsSJUWrzveXT/53VcggSGnNK2/FUrj+F4jNWUMXvDbHc5u?=
 =?us-ascii?Q?cCM2ulSfOP+dH48BzSvSC63Hl8sCI6z37ATjgYnTuu2pZy25equxarJ5R4zl?=
 =?us-ascii?Q?XJL4Y46NFSq7l1T4EaVt2H1OZAD/6Sty1IQYZkmU6lJIf33uIA7FJNI+qhUj?=
 =?us-ascii?Q?Nez7f+YDmODhmTtBMKBC9rNaaBckwVvT3eDT1Vr9s2M/Ys/HWAmXNNVcbS03?=
 =?us-ascii?Q?vsHOqAI4plLsu2z3s/YoTqFZXhB3Acin6vEQ5u7wP7qaU28lvWZa1QyweOL3?=
 =?us-ascii?Q?76h+KC1DBfQalj38cRdK4PbnL9TsusfmmEuKe4YUybvRgWRTRMhLCaxFx4+u?=
 =?us-ascii?Q?7P3zWRZvDg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Cy3PY6Qzqj+2x6wkL0dCZXzWZw4rVmHASAz3Cppxknk06otd/YHKvWBuI4XUqB7fvXiKB74sGWCxqlmLAmIjBWNk8R9j5VcshoOJaRs/qXntDRFyWSOpPHIiCvAVJ3kUwAtgsBkcLo5INZfbCrqwRkJp76MPwN4/hT1lwrI2nfNqGFuVwzqxDPI9AylUzjnTx/NRfp9324+kB3vOw3XGMQ/NrI1JwWEb6YVV2DLcMMJa/54vRGRem+S362vfqrDjOi0oOXb+hP0HWh04MXEJ+0zORx35jg+UFgNPqwo9u0LLYYSFIwypfskum/JQRXPImGHWD/Q6r4W8Dr1KkpeYeiMkRflskWbPhDJPRKUYTBijs7EoKKz1smY5IIzL78airxcsGORBziCUc+BNypK5jYBxxMh7Gv4T+0/kJoAxIBlI2b/CxEql4ptKAl7KRsaQldKsAnc5MNzAqdxzsqsUUAigkx/4ugr1w43i/Xs8pEpfMcsbaadMYNRbxlvqt4ZFspzT9zDWp3RjYoMed7oQOKWArXv36lesiYJ7gfdD9TYRgRRuMT4DEfGscjF/MuHQ7VznN/uOKSy0L4tXEcNHCoQ5Ix9CJOf7o/u8qeL1Fk0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3091fece-5741-4ca2-d9b6-08de681bed1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:43:48.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bld5Di2PF4baxpZCqGf4I6p22uNzGJoRyX4/6IIRI2sbUACn/LsRLBtpqj1/ApOsl/KPxHOhf2+NUbobt6U8zbtBfhQI8IEHK10YCjxgR6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090175
X-Authority-Analysis: v=2.4 cv=YbOwJgRf c=1 sm=1 tr=0 ts=698a470b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=EV9rZ6DVu8w-yJ9kQI0A:9 cc=ntf
 awl=host:12148
X-Proofpoint-ORIG-GUID: 3jFv80Mu_1MYg4J9g-u_zZ25J3J_w58w
X-Proofpoint-GUID: 3jFv80Mu_1MYg4J9g-u_zZ25J3J_w58w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NCBTYWx0ZWRfX3G9A7CuTd7d2
 OWAvNncwLCRokhW1wvY5o/ZDkXP4HC4S4NihtW6cc6bL9sslm8vG0nF8CnOCJxrj524tI5CXpYl
 TLLuZsZqKIX5lSJ4hyDJJGTWWc8f31sTYHFZ6vmWhI/C8hB1OlBYmv3GQiQz0DVY49+RUNP8Gix
 ZsTwRXXETBa1E47XnQSfQCBhj7HAAJweyxaQllI5zRNuH4gAjl097It3I/LKDoVJQTRGYqr7+kL
 C7rJrmo2x2YRmJpFX/GtC/QujO3HxiJvQuW+emJgSwp1xdXpirltzP35Pd0pkes6XnuOthxNDiO
 B3weJCJTeLtAC1TdsrZwh/2mfAnMKcWvmSUIXh+OXZJd7XOzZyuTmc2AnO/Ap/poiFfOdKQ/OqS
 PUxd6k9Cs1aW9iNlLDOoUFiewtefYiIGfVqV8P/oowbFV0JdV/U+FCrO24Nxy/7zbO5RxE3jVeQ
 Ga+LbBaNcabfpZ8LWs7G8EZh42gKZOY+jcQN99uc=

For PIE executables and libraries, pid offset probes need to have the
address adjusted based on the actual segment load address.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/sys/sol_procfs.h | 3 ++-
 libdtrace/dt_pid.c       | 3 +++
 libproc/Psymtab.c        | 7 +++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sys/sol_procfs.h b/include/sys/sol_procfs.h
index d195a108..950ab31a 100644
--- a/include/sys/sol_procfs.h
+++ b/include/sys/sol_procfs.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -50,6 +50,7 @@ typedef struct prmap {
 
 
 /* Protection and attribute flags */
+#define MA_PIC		0x08	/* position independent code */
 #define	MA_READ		0x04	/* readable by the traced process */
 #define	MA_WRITE	0x02	/* writable by the traced process */
 #define	MA_EXEC		0x01	/* executable by the traced process */
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index ed329b9d..5c62548b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -55,6 +55,7 @@ typedef struct dt_pid_probe {
 	dev_t dpp_dev;
 	ino_t dpp_inum;
 	const char *dpp_fname;
+	uintptr_t dpp_base;
 	uintptr_t dpp_vaddr;
 	Lmid_t dpp_lmid;
 	uint_t dpp_nmatches;
@@ -202,6 +203,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		}
 
 		psp->pps_nameoff = off;
+		off += pp->dpp_base;
 
 		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
 			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
@@ -470,6 +472,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	pp->dpp_dev = pmp->pr_dev;
 	pp->dpp_inum = pmp->pr_inum;
 	pp->dpp_vaddr = pmp->pr_file->first_segment->pr_vaddr;
+	pp->dpp_base = (pmp->pr_mflags & MA_PIC) ? pp->dpp_vaddr : 0;
 
 	/*
 	 * Note: if an execve() happens in the victim after this point, the
diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index 40543511..e7197b38 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2009, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -742,8 +742,11 @@ Pupdate_maps(struct ps_prochandle *P)
 
 			if (mptr->map_file &&
 			    mptr->map_file->file_map == -1 &&
-			    mptr->map_pmap->pr_file->prf_text_map == mptr->map_pmap)
+			    mptr->map_pmap->pr_file->prf_text_map == mptr->map_pmap) {
 				mptr->map_file->file_map = P->num_mappings;
+				if (mptr->map_file->file_etype == ET_DYN)
+					mptr->map_pmap->pr_mflags |= MA_PIC;
+			}
 		}
 
 		_dprintf("Added mapping for %s: %lx:%lx %lx(%lx)\n",
-- 
2.51.0

