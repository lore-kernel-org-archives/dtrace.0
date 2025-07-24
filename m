Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47939187332
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753375470; cv=fail; b=nVmvAlDcNjWNeycGeohZhQ0WaSSBMyza0Z9b9IHclcBaN8jV8NTKFDvBHz0A+vEijGF0o3s6RnV8B3priLOEG8XySaZTpIIoxcmQwh75Mxt6xU2PDYdrJ/TGYN72G09Q4hSs3LqGd4/MdCowjObl99otRHdrDGnsP4WAq+xk3rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753375470; c=relaxed/simple;
	bh=EyE4rOip0gKS2J34JW1mP7uOyTRwqut2KZdExUZLBZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a6dymeCBb2CdkRkpL8X04Zr1aBsYZMBQm60L1FUlL3dUiH7Ef4wmkg6RooRmbEQEjEmAcwOhAvifC9rsQcZsezM7qRyYIVvUk4F5hbFBYYkIAseRP++onGzhp98Z6bJhbxG1V00HYuvjEIHf4KV1xlF6NBuFKOMbCgyhawtGFfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZZXfmYAs; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QP2ff7IK reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZZXfmYAs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QP2ff7IK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiH2s003105
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9/pV+DdFJuFdwuMI0fO/zfgqDikhWN4cF5tOrhSlm7s=; b=
	ZZXfmYAse3OgoRoGk1hzCwrm2DJIOXt8SbdkV5hPjdrVO4fsHz/juympRUogn+1Q
	9NUThhAzAUTa01tYvwmQaWcaOAX4dzBq8iXCN5BbHsGvedKc8PNAF96+18ZWZUQH
	o6DYDSbsMjIhBtYU78L9qCtEB3lz0F5MYrTLBguP1kxVRWHhw0zVIgvbS4x6bviv
	1raoCu2HCEuTkPQj5ES31m6C2s9OfiD5BIiz/+8wyJxLM7FEvhj6Hzzka7oLCuBf
	dbtYSncg4biyyPOV5TJ0XFUGFeLo+PdGH/MyJiXlEhP+AZBzCco6u3gmt4d3hA73
	NarHr829vIRWdNIoDPsXcg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056ehwe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:44:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGIV4h031510
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:44:25 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tjdh5f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa2iUqpMqhZ/sXgAEBW4uNc22T+/2fezDZ6M3Pf5PFvMJQri5Yv9bMUDa9UcCFOYRWX62gKJ69HMeOZSHU21AxJhau5nrLcU40A3l7kCJmIWmNAkEICY+D5ene+083XjPbVEH4eajFCuDMSJbSyNSrWD2ovGbcoG65ROENJ0JQXbhIlht4WA322HQcau8+yEALHarM6hqfrha+cEcO6QbymaNwO/TpCosnFNeeK7vyb8NLAW0GbItNo2Hu3mwlFawIXelSi2oDtkiUpNW6zr7h4j8ZyKUeVliEHI8WIH6Ftv3tEOWy/nJA9Vz7dnu6HAeMR0ixf7e5pzVskgK0t0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dodKZLQaBV0ildkAhAp6dSvaXodr2EvPyhUFDo6vYeU=;
 b=NWJ5GzyXxS2LaLPmKWi3b0+evv3fZNBTsKtJwps0AgzsNC3kkGsgi8mEJNYlQPddFSp7hBFBVQSWb1LWn+n/vtDIpaMsDD8TTlUQkO3JyRTyjhxpM26jWHMR7w2/iTE+rg+WJYpgbr86Bo2Uuo2pAXvPpDzUKT7kH1639RVxhkHlBQyPoNMdROhjgazABJo05BTG0QpbVeWPkDAsl9+pxJGOu/i4L8ATnXCtxPOgkFXYttZO+27LDeuio3TcEV83m2DqdZWDQZSjhHB/ng7enTulTaAsdq7B/uGIKvyqf66irSaS2H0jFWhGZz//MfbbuChah3wMXhi6j2psiabcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dodKZLQaBV0ildkAhAp6dSvaXodr2EvPyhUFDo6vYeU=;
 b=QP2ff7IKNIQN+JewxvnwLXB+5hYvCvvS2Z6FcHl784nW0b9fYCsOtBPTiOlGGheUb/ogXk6Y1z5iTGpkyYz2evw9r16KJ2N5LC2LHUaDIrA7sh9n1WT9wztvvXUAL57bFo3djF4OSNY+QaNKhlMQnfAh8Ib8/jSld58ezj9hGSg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB6243.namprd10.prod.outlook.com (2603:10b6:208:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 16:44:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 16:44:22 +0000
Date: Thu, 24 Jul 2025 12:44:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] demo: remove demo script depending on
 non-Linux OS features
Message-ID: <aIJi4xFM+qaQzRU6@oracle.com>
References: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <a84420f3-be19-d5fd-ef38-b542af302cfd@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a84420f3-be19-d5fd-ef38-b542af302cfd@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 669f7116-3f44-4dc0-6cea-08ddcad15775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MIrSoc/CBgI/MiBt7ahTI+d9b60gg+WsNKT1RzdRXDA5ym3gONtoE+wW2y?=
 =?iso-8859-1?Q?vqG9ay4cDxXpJUnNjQ8YZm1b742S+jlwpzoRYWNWIYzkEBZf8bYXQJutpk?=
 =?iso-8859-1?Q?QM2zTfw7dr2D0hHADYukYotWMgiiLLgLwdE8z8V7ki/GSkg81Kfq49k6Tv?=
 =?iso-8859-1?Q?l6UU3jrhVCqngW6AJPzrBNp7uYEluaKPGTmsfYbbdJVYbanwv5o7+0d5Iu?=
 =?iso-8859-1?Q?Ki7z3niRZw1piD8WlgvIl0u/DvyyY/b48QhX+VT91Ow/3WeAX1wvRgxVzE?=
 =?iso-8859-1?Q?1FazwUMkohBagVX7UwCnF9z/LKeOtcGgJ9054sm9zfBt8jqrl744NfHvqW?=
 =?iso-8859-1?Q?QxE9CrRgA1gavGVotAjQAAOSGaoUEFB6+stL0HjY1Eg8gpsaOHX0q/EORL?=
 =?iso-8859-1?Q?kNIpTBa8mwAmDmepuGYEkxCt/an13HoJfnl466PBmq0SnX/w/tULEZKXDP?=
 =?iso-8859-1?Q?AmWdZgSfaUtUwpE6izcLCPWv7hqiW0749tmIYHD0r29VrpXN9OOAC6SQPL?=
 =?iso-8859-1?Q?TYcuNTNl9zFKKrIKlKH6UvyJTJxw3BM+HMU3d5kfwTw7Md79LloTFdCoiO?=
 =?iso-8859-1?Q?jzGhwqAe5nNjoRO2UmQFS5I5Vgwc/FTyYSXh5FaVwy1HiLiCPUBfWku1Av?=
 =?iso-8859-1?Q?plIGKq9LlOlxtwIpR3FdrXIt5vKwS+vFkFvTk6bYNwxRkGrCh/oxdd9G28?=
 =?iso-8859-1?Q?eXTX/+CrGupIK4WqHMPBpfd3gFfAV3QbbL0AuYoOmmFTO5sq2SY3YV8QdN?=
 =?iso-8859-1?Q?mFlQnVD3Hik1O5AAUDdMK8YdYsLanyoiKgo0GCitKxZl2iePOMDRvByIjQ?=
 =?iso-8859-1?Q?8JtXgoGFKuY0OMM0gSgLX4zIUDccuvA7Rin2aUdeTT9wdHHGywbLZ2YYIN?=
 =?iso-8859-1?Q?6uJjSCbfTWXAjog83eLnGY4oRh0qJMnrA3zc3vT/pIy8uH3BmPE8Mm7xXi?=
 =?iso-8859-1?Q?GRNIwdQr+bhvU8KzpGnaKKS2puiiKpVIOe1be62T8EAfaIiFBIH+sDJDsh?=
 =?iso-8859-1?Q?0fmewkV1RgWTJN6P8tynBMueFkUUVJ8AnH1s47frmg9ZW78nRZC7/rYu76?=
 =?iso-8859-1?Q?drCqfn8ucBy76sTdjANC7Iwb6Tr3GXLzBmqAm9SIabLh5jtH3le/SJ2ASc?=
 =?iso-8859-1?Q?i4JFuSKtjOuRCiPi86D9VWCAXTo2Rql0AGC/8yxyMhRig+Q3pR63hBNsQd?=
 =?iso-8859-1?Q?3dnZmHHsaipQqLas3k8v94dkiaXJqniuqYZCWE73mp+tUaVDJaBndXlGjr?=
 =?iso-8859-1?Q?1cwGHwU4o9tlKRGb2VYkwgEanM+JdeyZrDQxWSSDo+T6c4Zqkm0f80oQ5V?=
 =?iso-8859-1?Q?dujbe0AlDyTxB9O5gW1LzkxsxJHT1V/YCbAmAjlrQEaoAAJdqYuOky4sQu?=
 =?iso-8859-1?Q?h3F6fIA05frgDK1vxFSUauINhlrakESLrWrc8ZmGz9b/Hqs+zd8d2UzomW?=
 =?iso-8859-1?Q?t2SD86kQtq8pZtb7g/vwbalQiSXMqxf+TWnXMnGqo7Dg2P/qpJwAIAxJt1?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tMa+Vom2QWRCcKf1K3jVd86zRLIcIPA7weP9vTeZUwi9HRXhsr87qqvdbA?=
 =?iso-8859-1?Q?f2s+NY6rPEErZ7Qn5RuEwJ6IFcE/8R5AMMioL1iu4JpALEnryHKggN8Qlv?=
 =?iso-8859-1?Q?KFCtrcccXPxkUN/kOz8Wj79bEc/2esJRSP6iBYljtCCMhSHTVh0qCDYR+O?=
 =?iso-8859-1?Q?HUAerfb00IGC1GOpmsPmew1kBjWsXrTiuukF7/LxViiWNudC5K6a8XWl88?=
 =?iso-8859-1?Q?gSTLgNtUvcE+KVCWuxygMojhhOiWIftvTmCuvtwRAwTie7GP/X18McHmY2?=
 =?iso-8859-1?Q?69PTEnSwyd95Y5CdGZmEM9/wHmGu2NLJAAmXyW84usPst+SoGFmUklt2uo?=
 =?iso-8859-1?Q?Gt+1WRKU0IwN5Qn3PGphz5oj16HIFEXQdEotuVp1++u/zHR95zUziDaEx0?=
 =?iso-8859-1?Q?EGMTiS6YmgkLXw4TMXB2Pxvaix0mZTklmzUJOKVX0XqhbVngagDcUVIyfO?=
 =?iso-8859-1?Q?PUhDPXdRSQ6hE+49yVPdQUVA/iKiltIcGm0vqgb4fQIU8WzOxMdAkQMxKA?=
 =?iso-8859-1?Q?widilQOApXbe19AmRVeGnATiiskU7G0jYi+gwL0+eR9w+RxAxXdwSbmxnJ?=
 =?iso-8859-1?Q?UugrM71ZjiQxN1NkEqyT+E9jL7GC8gLQf8uQWqkP39k1Qjme/qJxFJRexX?=
 =?iso-8859-1?Q?udNouf/WgpDQIqTVvvFZR4M+kk+kUe19/bpk2cQ3qo+sVJRoN7rG18GALk?=
 =?iso-8859-1?Q?cycov3Y4sZDzm3Rjlz3hVpE433LoVnOL3exyox0zHu0CozGbAWxQNAAtdw?=
 =?iso-8859-1?Q?AKZVX3pl1V+xcmCY+bk3fZe9pR6uBhr4u0+H1X4V46SRFliwJ2OsDvLiAT?=
 =?iso-8859-1?Q?ZgnFxvehqsEblpOv3bnxk7L9BLuDPz26xmgMg2rBDpisSWxCMZnIE+RWam?=
 =?iso-8859-1?Q?VfbkkFP2trKD0gz4sPBQbo4mjtDzSOxX3feeO38HBWrFQyEG2QRVFiI2+/?=
 =?iso-8859-1?Q?KowXFj2qwgL/75kZk9f2ajV+dnr3YoA5KkZIdnH6wKjNdSYDKN6Tz6ZvHm?=
 =?iso-8859-1?Q?aFVar0z8j4fhwZRKY7IwBVzEG3Et+3dW5LMtyWuJTWbXUPD02MkQ3KCdHM?=
 =?iso-8859-1?Q?V7Iy4ZhMg4rH+uLxSu4VGqVANREwl8TxKeZVE0XkJ3NTSjJYwsVa65i7xY?=
 =?iso-8859-1?Q?fNdU3/2JBfUBO3pEB93/KaGhsLVRPZvbcWPiLX4AozP/x5p29p39NT5E92?=
 =?iso-8859-1?Q?XQHx4UsvvkgemvXeRo/RaFPe8VPfZBlWW+nIT+g3mCCovyyGvKFvdXlVzi?=
 =?iso-8859-1?Q?wmf9m69QmGATO5xb23dLFVn80bMuuO1T2nFmfdI325ZuYmrRsRPh1qe+bx?=
 =?iso-8859-1?Q?nyBmNffmcGG/wBupyzUy/pTTQJWiwHYurXVCuVhZ+g3XajRp8cTySOCt+o?=
 =?iso-8859-1?Q?481zl4FLiyWjVuJWaNCRloUmZhIdoGbANo9NV7YKgEj35tDDWYseqBBr9O?=
 =?iso-8859-1?Q?Zp4HHPJ0xvaGPPTpPzdDEg34xH8MQoqPvtPESiSQjj1+IK8DciZwyeiiuz?=
 =?iso-8859-1?Q?c1xtqGtqQ7ni40KI9qVt25V6t4G/ZU7nhTCVbL6p4XClcxMQBtD47qWSIC?=
 =?iso-8859-1?Q?5aZ22gd86y/RRQgrsJt4gF79oJC5lPxA/K1U1mQMBlO+eFQ6QZvnyLIOIl?=
 =?iso-8859-1?Q?hyzNKauO9DMPW14QMF9RWsNy1qYgQr3zOdjUWt53bOxaLBguuGb4KtiA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UdWMa1MOQNq0657Vaw/ScLZa8+23UEwGYCMk537F25HKqt1EtugfSRvGLpVRal8l7NsnozM2c8RKFClToj3wlYKb3C9YbUMVo6NXrzjIMjKu1b+CirD7IjoG7mLxsBhhb3gC3l2ugSTd6gF/5s9AsDkbPFejpmdC8zswWAfbGAyhTfg1fFQJc51eY+BGK/+0p+kfoarYkJBc/Ix7F3atrHaNp58TEyLM+lcsd8+oo8PSqnyeLKvr2M3lit78w3zN/IOojkESDmWanAPHC+uzYkD0W9PZJvNFTvWtxFXBy9Pq4VEdjE+HEy+rk993pnt5W0S7FpHTGNnFU/8/JvtEOCM9+kAOX4NM7b5aY0O1vsJZTQVWdzfM8H12hEzf1zcWoEhZYoKYXgjYMGfvjh2aHzxyVDXMsUH+mlqAYwRHSn5WbhiatZ++dFIevZWNQXJxayUUFJLRoHKxX0tktrz7e0rEj+XZOEcfKdHwmBk1nEbnUKAhTehLarb5xblMGoRCrlCeN0X2M1Z12meZG4EdR5V63smrshCqWOU7YORWEj95ARlzeS0N5JLxR3QmfsQlbMZevSPUVq3qMi7f9vrMfU4qcF/Sa9Knc+lOcIoyWg4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669f7116-3f44-4dc0-6cea-08ddcad15775
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:44:22.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ec5oNCkGhUkfcy3cYFyKENuMIMFPHQlnL98a+0bDhGu86Q1vwaGYWeLjsOxqRY/12KcFJdury7S5NLOEz9uOHVgHw+92R1BCYRw5MY+t6cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6243
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240127
X-Proofpoint-ORIG-GUID: VKVFwHJ27ZXmibWzAcyRl9uxw81DO4xS
X-Proofpoint-GUID: VKVFwHJ27ZXmibWzAcyRl9uxw81DO4xS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNyBTYWx0ZWRfX+36nni5nCdJE
 u9wRhLp232xhQMg8qfKyWaTINKDJHKsHFvhgtGvi+RZwzANEq9+xMdlznnRiOsI0XUlsQgTpFDz
 B2WzOCZD80AUCJc5tXQlshnHwdxJC3qrQW16zAH3z+6sZLK2moMmvDDmZSkUGIXXDQAVaZRoxd3
 5Q5NOqXqQbgOqkrSAdQri+QQNzYjEiOuQ+ZwIV+gHJBIhYZePNAR/xplyoLUZSqytungISRFsne
 4afY50iLjvdkvX/sKG2nf6dDkf6RW6ZXOWK8Rh84oBw4JtJQD77f2Fywhn0NpZq9FNDLt/avZ8X
 oLx7bmmeCCW/ovuOzpTT/Da0PMRWK1HOcPirXmQHFHcu5qAonq/4r89vmWhgDEu0CUiJixpMN6Z
 aBfhCg8WU6SYkDrEvCoe1IjExxtThpB4OLiWbYOUUVttdZvsw7ldj+EblTBX9ZrBmyKLw/+/
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=688262eb b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=Y7sRifEES_tjaf_NiBIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:13600

On Thu, Jul 24, 2025 at 12:32:42PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> I do not object to this patch.  I simply do not understand its limited
> scope:
> 
> $ git grep -i solaris test/ | grep skip
> test/demo/buf/ring.d:/* @@skip: Solaris-specific, unconverted */
> test/demo/struct/kstat.d:/* @@skip: solaris-specific, not yet converted */
> test/demo/struct/ksyms.d:/* @@skip: Solaris-specific, unconverted */
> test/demo/sysinfo/find.d:/* @@skip: Solaris-specific, unconverted */
> test/unittest/predicates/tst.predcache.sh:# @@skip: Solaris specific -
> requires rewriting

A particular problem needing a particulr fix.

The ones you mention may or may not be rewritten in the future.  But they
are not currently posing an issue that needs fixing.  This one (even though
it is skipped) was causing packaging warnings.

> On 7/24/25 11:50, Kris Van Hees via DTrace-devel wrote:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/demo/struct/kstat.d | 29 -----------------------------
> >   test/demo/struct/kstat.t |  1 -
> >   2 files changed, 30 deletions(-)
> >   delete mode 100644 test/demo/struct/kstat.d
> >   delete mode 120000 test/demo/struct/kstat.t
> > 
> > diff --git a/test/demo/struct/kstat.d b/test/demo/struct/kstat.d
> > deleted file mode 100644
> > index 1ccc3bb4..00000000
> > --- a/test/demo/struct/kstat.d
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -/* @@runtest-opts: -q $_pid */
> > -/* @@xfail: userspace tracing not implemented */
> > -/* @@skip: solaris-specific, not yet converted */
> > -
> > -pid$1:libkstat:kstat_data_lookup:entry
> > -{
> > -	self->ksname = arg1;
> > -}
> > -
> > -pid$1:libkstat:kstat_data_lookup:return
> > -/self->ksname != NULL && arg1 != NULL/
> > -{
> > -	this->ksp = (kstat_named_t *)copyin(arg1, sizeof(kstat_named_t));
> > -	printf("%s has ui64 value %u\n",
> > -	    copyinstr(self->ksname), this->ksp->value.ui64);
> > -}
> > -
> > -pid$1:libkstat:kstat_data_lookup:return
> > -/self->ksname != NULL && arg1 == NULL/
> > -{
> > -	self->ksname = NULL;
> > -}
> > diff --git a/test/demo/struct/kstat.t b/test/demo/struct/kstat.t
> > deleted file mode 120000
> > index e9f7e5b7..00000000
> > --- a/test/demo/struct/kstat.t
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -/usr/bin/mpstat
> > \ No newline at end of file
