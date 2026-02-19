Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C17C8E6
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771529131; cv=fail; b=BG4K+TMmW9lMvkB6NFDoWBD8D8nDxokSeQmFXktQTADZLArHEj0E6mQRN+tg18WwKwobiYINZfwMXBdB88hrtGuuvVGUwOouwllMENxlM7LPV50EYKzlDo1AIC3xioF1gzc+DSHc4PeLbEozxItdAW2VGLQPca2AbcbxBdtmLnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771529131; c=relaxed/simple;
	bh=hjmbmH1Vyo7ug8mFigCl4OMgImwEEEfzq8SZtjDNjDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eHv7WH7M28XR2289Aki6MTbW3IIikiToM6SL6sxaALHbNcU4MLmg3p48tyExfg9wrdsbV9DeIfPaplJ5JAM7cF8AvAY/vYq+OheOWWUSxyKX/qZ+Mn3boMrzMSuBczV4bFuWbzT4rz126VkD7lTMBx20UGdJbO5qCwYBx2eHAjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MUwnAb0I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DRYEPO8N; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MUwnAb0I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DRYEPO8N"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JJCqn61318049
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=e8C4/6KkXY2ogQO9LJ
	2kHzvx61BzFr08qBmCtxq9mkk=; b=MUwnAb0IDt99FWY4kQi7BE8rEpL90aWkoW
	kgd6l9cs8tEqE0XPEiURszO1jVd/vUREZ8TIIb64P5/qOLp1K2DKKC8wExT2JJM6
	7+gI9UFyQAXiS/e4VF30wtVPuyJurnO1Q/8wg1pymDju4rIlkurDh6N/8iDyQ58r
	OAxhIpnTUGAfJ5T95MmSizw8vaUAJjmeIfQ0c/+sFDeYIk+7fnvoPPaFP1gy82Ln
	3/apoztzXfASsY1ii695/9mdhznir0lqD0k4ZGcbE4P908UFzTcGObtLFg+BkdL1
	QERgmLyQZjJxsepTuwxoSpUkrYMJTmOKoqFmOPjwEzQ+ruml/elQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0rg2vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:25:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JI8pQf009970
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:25:26 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2budr3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0/fyCw3DuiEtCJVmCq5GghsZveAqTPRviGPZpN9hOb3oBWOjA+OKIdOe9njr6sucJVAT23CwGYv7u+PivNoiWjmzMt72+u8bQshd9IzlADl8Pzi8X2bHHAIiNyfkCjY4fhMPymcp6qA+iSozRbaCMgZ519YTqXeGAKUbdUFa0rkN0INn/oR0Y1XsEc4HwoZ3O1KJcEZHOOqibE62T3G5iIaVtgGD50i1ckQpLQaEN3OrGbWYoudUVSDUlmulR49jHoL7m1M2uiVKWtghsZ0Akir1XoK+6odzTfb3A+ce3K6Abu+dveorq3f1c6YKbIMAjz6CVpZ8HKUNn+k7dGkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8C4/6KkXY2ogQO9LJ2kHzvx61BzFr08qBmCtxq9mkk=;
 b=DxK2mWCfgsHiSfE1Hdz/MFqyb6BThGSUwo264J7DgK6FlY8aOUX7gxVuwwMJ5pFmeSc3CpmQ82pp3fodC7WS0uie5JYuVKevpnXZYWYBXsfYrj9EPfRmZTL6m22pmJ/er7XXDcWMU/15DM3K92jEzHRX7KTuYsN2FIMjDOzJ8oPWHHdZDTH7+4W+IIJ7JT/9AZSx/vds/HPjgAPWPX3/2IS18bq+h0JTYVzwI2eW1SXOXjYJJ7tYVeYE7LKolka6z4BsOftG/G8xXVhADw3Lkc98OObCUJZhftYxJwAkWPnfr2uWHoKaTir0mesGura+2Y1JQERHrU/P4sKBa6N7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8C4/6KkXY2ogQO9LJ2kHzvx61BzFr08qBmCtxq9mkk=;
 b=DRYEPO8NdzTAs87B629eb5/MfnpQ4N13i4wOaIlEHWWRxeXiVn7oAEn1qPQlc7WFA51FGzBT+dqMsQH9ammBXNgYvk/GMkl22mzND4cuEylitXPyplCipo9mtb2muAjcvQYGfRoY40PND3FMFu32fIPhGo7gyV65AUuC4roD+Js=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB4654.namprd10.prod.outlook.com (2603:10b6:a03:2d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:25:22 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:25:21 +0000
Date: Thu, 19 Feb 2026 14:25:19 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v5] Add packaging configuration for Debian
Message-ID: <aZdjnw3451u3/kAb@oracle.com>
References: <DS0PR10MB75224B8E0902B87ECF8AAEEFC26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR10MB75224B8E0902B87ECF8AAEEFC26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a56a673-a28f-4000-65c0-08de6fec9fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3PT0uyijALQTA8ihQRWP5Zm4EkTSQedTVHhqWQ+ZSPDeKPemC/AXxxaI4Y6f?=
 =?us-ascii?Q?DSfeC6SM4JNkUn/LgX7b7pRz/wTM0u646QLHZc+lrbunky228ZalG9P9QgFb?=
 =?us-ascii?Q?MbjPZgqRD40Aj1KE+gIsizUvIIOk3KGb2F8B1gNxN7104eXX1ZvIGPQdg6h0?=
 =?us-ascii?Q?DnQtNqx+2E6mzIKBxqNrPU23mVIQhUbtjp1keNOKACCwmpZUmFp/ad3INY+d?=
 =?us-ascii?Q?H0XzKQp/o++mJPx4whquFzKmNhtP2015cMnZGLy+4Nwr/jTQRn2ih3QSBTwS?=
 =?us-ascii?Q?l9PlNt1Pr1wjoqNiCLr+7KQAP7zlFHL1OWIf2oDIxNaeU6gcsnoJvDuYwxos?=
 =?us-ascii?Q?bp/KDA2ylB2V9bj2cEW8ugelS6XiGFW9oJ7gyeqUC6chPNrR9asdGk99jgp/?=
 =?us-ascii?Q?2Er0lq30Dr6fpePzoU4W+Gm7qA416QQESXvNGQ+sFTYnTPxfQvo4kULrriOM?=
 =?us-ascii?Q?aHJYGNS7E08PhMYrwQM9x2sSIh97Bi14jSFQrHSaT9Cy1K+oVGlWWmGiKsfQ?=
 =?us-ascii?Q?JHsMnr6d0iat/bS0KpruGrArgYYFPG4Ay4yAlpbhzaSBTfhLMueaRPnL9ASE?=
 =?us-ascii?Q?K9JktnVawetWCmDHqcotKl1ya2noeLJwOJ9Q0APKLyq2RTqIERZKhGyZQwGb?=
 =?us-ascii?Q?vLlYHJp1AbXsIHurDqu/xJgyqeLGYgpWZe7os30lX4yVrYPOw2QPMGPirege?=
 =?us-ascii?Q?bfaxECb3F+zKLXqvZ5U+t74DWbog157gMq5CsA3qU6Bdeo1PzKMFASyX6Sv3?=
 =?us-ascii?Q?s6HkYy7gydEeY6FNoyEA41o9zi3nVF18dZ4kGuHlrIudWYDUr3RdTuBPl25s?=
 =?us-ascii?Q?wRoihsmk4UA3ML8BCv5hQNeOeRO1QE6adwhVzYMhVNYXWxYJZ1yr4QFaHjiM?=
 =?us-ascii?Q?8fKY2UXHYfB9iahlOB17aklMpk5rrHL7HPV4fsAk3nC7PtCamnQjE9HLMrMB?=
 =?us-ascii?Q?uDWH+aotA4QR2/qUACKXyv3sg/V6uhjySqazUdEIXMNTaDgSYLhFr5mOKg7k?=
 =?us-ascii?Q?A816TihhQ9YIydDmF6s4vvhJwttJjlgRJvhd7b5Rl9lPPboX2vJJKdv0790w?=
 =?us-ascii?Q?PMy+x3nJPzixyg/w0ZRH/WHem1Hinr+T2t8G7sknArJ21u/phvJMX3rhVIQP?=
 =?us-ascii?Q?km4K8rFN2aR+vIg5mKI9tmdyAJsnz6JfG1jk5owqzq3kpaGzuUhCb+rn/gH5?=
 =?us-ascii?Q?+Jh9RRFgnlwOLJjmmee4tCB4EEYavNO8/Rmu4ePRFYsAvfsegfVV0wISxNA7?=
 =?us-ascii?Q?Tz1mB7DyMPsv1QZX1TafFY2QPpi0Rk1ObZj+G5lrCfpFxJGOonlua9ZCqKuO?=
 =?us-ascii?Q?QHKFUuv/SbGFJRiTnw3M50vzdArZ1dZHlPkht75b8duWxP6ROOrfQrM5xD/k?=
 =?us-ascii?Q?WfEEN4HX8j290I52Rn30lHHx44bX9N9p6uAgBpkmBknkOV63de+CMRU/p0b7?=
 =?us-ascii?Q?K/LpBSZUlh5TKhHZr/Hg5LPtFe8GBbjzkdhpc9Ab8inuyXFGRbwdfCpXeNbk?=
 =?us-ascii?Q?yVfIFmK5eX4mMyhc5iyj7ZQV5la8QDvgb0yS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1G9qWV312xATyzApYCjiKzLhV7q/XQWvSBUtvnouA97XkKxai6wT2/VvFjvg?=
 =?us-ascii?Q?QW8Q/QAFSnRg9GnZ8h/PnyFWhDuE0B+B7XFbp2kE9NPq8jNYS+mo8MAKwLwX?=
 =?us-ascii?Q?k+b1FT9sjF3okuhQv8Y0phrR32MCiVYDR2N1wm8m8IOukWXY1JqW4EsmnqDV?=
 =?us-ascii?Q?6TYeP1WzKsERgiYbrs/1rrHOvVpc9xAQaPiXy8EgxTYxkgfoEuuSc5PEjBjt?=
 =?us-ascii?Q?tu5NATyzm82+vtKRqvux8e1A+1PfF++jTAByoYOLFFuIvlTcIZEctzoL9cR5?=
 =?us-ascii?Q?L/UXe+iPIHvHAO7ZGJVrIXbFqXnlvdXqtKam71ulFFf6BhRhYRJ+a/flhUe7?=
 =?us-ascii?Q?ZN+yj9fvZSNMBJiWDYIkZ0IRzFCdqdhzbEcapk5DHizwEp9JDOBUSJHTH6nz?=
 =?us-ascii?Q?HU8MDlV7ke2ayG8yL8lgeeJgyfL5BL0vAQUi4Skb0j0p1TU4uIfpI2jZASYv?=
 =?us-ascii?Q?7+AgzLGePHCOvGpEQcmteZ5WLLlKriL0x3fC8MeRpVYC+LnHDR8uGBfTq3+H?=
 =?us-ascii?Q?8lqtoxg808yeUiC5DKH3FzhWPczOVg+AGdji/+aAdDN/1OdapQpaEKFnu4lT?=
 =?us-ascii?Q?eMG/r6qOcwQQabX9nrG0L2/K3rDZaLpmoZ7BT43JRxeEZn2u70BedTchBCSv?=
 =?us-ascii?Q?4j/ol+hrnTK2PXLVeQM58uFjVtuHsDJi30yamkxuERGia6+gUbIvY6ls/TdH?=
 =?us-ascii?Q?pt+BX2h3ItNg/xumhw7oyQ22aTlHZ+RnTCkATq/itlgT+YFjJEaSYPG+JIIc?=
 =?us-ascii?Q?Ph8PVqcFx7TU3IW46aLycTXJdikVfppnjcgxo6Y/nHVNM06seXYeFidx99QB?=
 =?us-ascii?Q?GvsBA1H7Bzl1sfinC6z9IV5/qi3MVPX4m5wPq3HtYhicBqJzmMWm7HjSkYJ3?=
 =?us-ascii?Q?M/io34VXjoC3Wr8hg5XFEaKj6cEbtGNPdh6D9oArrWBvpPauCZ5AlwnIMOc2?=
 =?us-ascii?Q?KbaZTtrrJ+nDVAPxA5QsEgjJO5oMuJu3+9ogvFQCWniR3jxolFJGvhYDQ2dR?=
 =?us-ascii?Q?QqIK91yPkpGe6MSXNAv+/Gmwcwdmbelgie3dLozZX2tSuIxmaPAoy71hiS87?=
 =?us-ascii?Q?WoBWNamOS/KJ+v3vcE/yrfrrMV0Wkc6Jt8yJpCNZs7XK5D1SP1JhLFoY25UH?=
 =?us-ascii?Q?R+lNY+ufxAYf68e7bdXxYp7UjLsvED3OpwsojST2PA1HzPJncrfUA2MYhwYl?=
 =?us-ascii?Q?psjQwCnk7vLwNNTNfQjyaJzkALBxqiXOvYK1FQyr9RfDJny6OywkLSc34gFa?=
 =?us-ascii?Q?D6ee9jVuyX5LhYiLZxNpY+xbaVjfR1zIu1PbMnVQE4wC7RGLY8tgHgi/QKqP?=
 =?us-ascii?Q?LFzRExXckkCz1S6M6KsYZic0h2h7HREz6tYjnj+crhNmiguljOUgfM8aclDv?=
 =?us-ascii?Q?Y+Xx70zO/3/wVVA4iCd3Fgq4EckV9He4NN2p5IvLZcVc72R6OcLjhEJ2knD8?=
 =?us-ascii?Q?DJ0FcPe5m2Px2qXs+3DabqxRgCRIiSy6ykPXJm8+tF0LB0aSlY1201r72aIa?=
 =?us-ascii?Q?o/a9HLFQX+rV/b8J2ZDXS8ivTxiwrhXerYhIVnHySJK+Ru36mOXvoF1mA+wh?=
 =?us-ascii?Q?U32UuHigtHE41koyGdg40HlCPwrL230vyhG1n/yY6n6wqr13bSrH+sUp/OT4?=
 =?us-ascii?Q?lAJpkLN843Kzotp2+nn8vR0PUOeKW9WEqA0zvkuNZdWyByS39oCJpsBEwkSN?=
 =?us-ascii?Q?n5uT12jLZfhOzM2jvcMKAiHtZEfyJF8cxcZrEt1Hum43Mjns2ttgGIgj7R89?=
 =?us-ascii?Q?9Bg0FG87cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6CCnhcvxrVbh3RNrZtnEhoR9tyed1ROEEGefr/6XTp6L5ZKao/0y91p6J5R61A/Snn7FSAIH+oZcUlQeWg1DtxAqCUbFfDwyI6D/HgA9vNvqXNRfhCzvwvcyOK2jk1PU8abZwWh+mAzu//T8t8TbVS0V/98SImZlmP9fOTcLaiGXxZRnL4+zn4eeWb9y9yVE7aTJjY5hdojWm8+UjwIdiEq6a68u1iBqgdF3ScjHHXa0+PtZx0amAwZytkhFDFQ+URSXspIw6q0OQCxUeYf84IAq0wsuCn6Fv/o0s9lSSnHwYzwCl1Bm1LWpehOSrkHN6wCRJjNTUDwSNBSuNhAoKMGf4Tlh3Li9BKF/r1PvSqoqjYaQsUszAWaFOjp6hgS/oGCp1AuTfyt0390m5Ck2EdR2Jk6gM7RK4kp9PF6/seSEiITajBjlx+KNGCWW5HJjTYRmwcjn9LwMoZ1fOoOtMQexV2d8Q5Rzcwp5z4Ua+EbkXh5m2gYn+JRN0mr/uCsmUofUms131lhv+7i9rbVQuMXIbFK0ceYw4VXmaJLVbzpJ+EWQ6qpkGG3C4/IKZdzFhshB/6i9uVgAYSnRvMr8Ogf+NKC6onkcTelXZg9nFTM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a56a673-a28f-4000-65c0-08de6fec9fa5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:25:21.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbNwJ4XQC4P+fDsYG6uTOuhFvrpzzyiq/uBgdym+W5rXS667/z6m8xdGSnw0duHDexUxDqH5Jy7LW3aTSf+aoCRl/21OeoiYVXSpnQRAi0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4654
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190176
X-Authority-Analysis: v=2.4 cv=V6RwEOni c=1 sm=1 tr=0 ts=699763a7 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=Ixkok3qfAAAA:8 a=mDV3o1hIAAAA:8
 a=lws1ooUzA5geAVBDy74A:9 a=CjuIK1q_8ugA:10 a=_4Lj5ymMnAn2NA9aJKr1:22 cc=ntf
 awl=host:13813
X-Proofpoint-ORIG-GUID: c-6jysFPqsbd4-Kb3c9SbW9gD__qr8Mz
X-Proofpoint-GUID: c-6jysFPqsbd4-Kb3c9SbW9gD__qr8Mz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3NiBTYWx0ZWRfX2PQsuS0CtXzL
 gbaCUuCCxYlicWONIwB3YkAZkF2f4w/zHJv2p0bK2psVhnswR3ZF3bt22T3+8HCvS126QTxrQlf
 tj7ZSsh8e6BdH7zZSww5FTpzuCZr2O1W0+6bVD23MOwwzc/VXAkk4vnAAaCTodVDyq7W4pMqrxZ
 +HHyhsx1zA1hyrfksKcNGm34hjn7Blaca2B+WZUIjZGjN56m1EY3iw2CU8XDqETI0ZqU28Dhy98
 PGD3wXuM0TzigE3jcr7x6ZDsHAHggYl2C25Xsqgp7UYOxM+cCO1KNu+NV9TU5N3dskKSc6yfa2+
 6lGWfkjN7LyRC4wqCUA92A1U0a1J3PrDx6WC5T4ec9larfT6tg0wE4cefqEN+lYWF/w/O0+Bjmr
 JKY7SMSTG0Y3dbI4bHHrikg+kYhj6Z4mMc8BFvy2HxSeAv7LeKr6/OScpREbuDkPXY5Afdz5h5A
 S1/BQE1opPVw5FIlRXv6JaJI5oeyH/rMls+QTt7s=

IGNORE - new one coming soon

On Thu, Feb 19, 2026 at 01:53:41PM -0500, Kris Van Hees via DTrace-devel wrote:
> Packaging configuration files for Debian are provided in dists/debian.
> 
> Sample steps to build DEB packages:
> 
>  - make dist
>  - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
>  - cd $D
>  - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
>  - cd dtrace-x.y.z
>  - make prep-debian
>  - debuild
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dists/Build                                   |  16 ++
>  dists/debian/control                          |  74 ++++++++
>  dists/debian/copyright                        | 103 +++++++++++
>  dists/debian/dtrace-tests.install             |   1 +
>  dists/debian/dtrace-tests.lintian-overrides   |   8 +
>  dists/debian/dtrace.docs                      |   1 +
>  dists/debian/dtrace.install                   |   1 +
>  dists/debian/dtrace.lintian-overrides         |   1 +
>  dists/debian/dtrace.manpages                  |   1 +
>  dists/debian/libdtrace2-dev.install           |   5 +
>  dists/debian/libdtrace2.install               |  12 ++
>  dists/debian/libdtrace2.lintian-overrides     |   4 +
>  dists/debian/libdtrace2.manpages              |   1 +
>  dists/debian/mkChangelog                      | 174 ++++++++++++++++++
>  dists/debian/patches/debian-configure.patch   |  17 ++
>  .../patches/debian-interpreter-paths.patch    | 107 +++++++++++
>  dists/debian/patches/series                   |   3 +
>  dists/debian/rules                            |  24 +++
>  dists/debian/source/format                    |   1 +
>  19 files changed, 554 insertions(+)
>  create mode 100644 dists/Build
>  create mode 100644 dists/debian/control
>  create mode 100644 dists/debian/copyright
>  create mode 100644 dists/debian/dtrace-tests.install
>  create mode 100644 dists/debian/dtrace-tests.lintian-overrides
>  create mode 100644 dists/debian/dtrace.docs
>  create mode 100644 dists/debian/dtrace.install
>  create mode 100644 dists/debian/dtrace.lintian-overrides
>  create mode 100644 dists/debian/dtrace.manpages
>  create mode 100644 dists/debian/libdtrace2-dev.install
>  create mode 100644 dists/debian/libdtrace2.install
>  create mode 100644 dists/debian/libdtrace2.lintian-overrides
>  create mode 100644 dists/debian/libdtrace2.manpages
>  create mode 100755 dists/debian/mkChangelog
>  create mode 100644 dists/debian/patches/debian-configure.patch
>  create mode 100644 dists/debian/patches/debian-interpreter-paths.patch
>  create mode 100644 dists/debian/patches/series
>  create mode 100755 dists/debian/rules
>  create mode 100644 dists/debian/source/format
> 
> diff --git a/dists/Build b/dists/Build
> new file mode 100644
> index 00000000..c75f9332
> --- /dev/null
> +++ b/dists/Build
> @@ -0,0 +1,16 @@
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dists_DIR := $(current-dir)
> +
> +# Prepare package building on Debian (copy ./dists/debian in ./debian, and
> +# generate the debian/changelog file.
> +
> +prep-debian::
> +	$(call describe-target,DIST-PREP,Debian)
> +	rm -rf debian
> +	cp -rp $(dists_DIR)/debian .
> +	debian/mkChangelog debian/control dtrace.spec > debian/changelog
> diff --git a/dists/debian/control b/dists/debian/control
> new file mode 100644
> index 00000000..66620d11
> --- /dev/null
> +++ b/dists/debian/control
> @@ -0,0 +1,74 @@
> +Source: dtrace
> +Section: utils
> +Priority: optional
> +Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
> +Build-Depends: debhelper-compat (= 13),
> + bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
> + libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
> + libpfm4-dev, libsystemd-dev, libz-dev
> +Standards-Version: 4.5.1
> +Homepage: https://github.com/oracle/dtrace-utils/
> +Rules-Requires-Root: no
> +
> +Package: dtrace
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends}
> +Description: Dynamic tracing for Linux (DTrace)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> +
> +Package: libdtrace2
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> +Description: Dynamic tracing for Linux (DTrace) (library)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the shared library.
> +
> +Package: libdtrace2-dev
> +Architecture: any
> +Depends: ${misc:Depends},
> + libdtrace2 (= ${binary:Version})
> +Description: Dynamic tracing for Linux (DTrace) (development)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the development files necessary to develop
> + alternative implementations of the user interface for libdtrace, i.e.
> + replacements for dtrace(1) itself.
> +
> +Package: dtrace-tests
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the testsuite.
> diff --git a/dists/debian/copyright b/dists/debian/copyright
> new file mode 100644
> index 00000000..475f9bac
> --- /dev/null
> +++ b/dists/debian/copyright
> @@ -0,0 +1,103 @@
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Upstream-Name: dtrace
> +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> +Source: https://github.com/oracle/dtrace-utils/
> +
> +Files: *
> +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: include/linux/bpf.h
> +Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/linux/btf.h
> +Copyright: Copyright (c) 2018 Facebook
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/sys/auxv.h include/sys/bitmap.h
> +Copyright: Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T
> +License: UPL-1.0
> +
> +Files: include/sys/glibc_internal_link.h
> +Copyright: Copyright disclaimed (all content required for interoperability)
> +License: LGPL-2.1+
> +
> +Files: libproc/libproc.h libproc/Pcontrol.c
> +Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +License: UPL-1.0
> + The Universal Permissive License (UPL), Version 1.0
> + .
> + Subject to the condition set forth below, permission is hereby granted
> + to any person obtaining a copy of this software, associated
> + documentation and/or data (collectively the "Software"), free of charge
> + and under any and all copyright rights in the Software, and any and all
> + patent rights owned or freely licensable by each licensor hereunder
> + covering either (i) the unmodified Software as contributed to or
> + provided by such licensor, or (ii) the Larger Works (as defined below),
> + to deal in both
> + .
> + (a) the Software, and
> + (b) any piece of software and/or hardware listed in the lrgrwrks.txt
> + file if one is included with the Software (each a ???Larger Work??? to which
> + the Software is contributed by such licensors),
> + .
> + without restriction, including without limitation the rights to copy,
> + create derivative works of, display, perform, and distribute the
> + Software and make, use, sell, offer for sale, import, export, have made,
> + and have sold the Software and the Larger Work(s), and to sublicense the
> + foregoing rights on either these or other terms.
> + .
> + This license is subject to the following condition:
> + The above copyright notice and either this complete permission notice or
> + at a minimum a reference to the UPL must be included in all copies or
> + substantial portions of the Software.
> + .
> + THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> + OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> + LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> + OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> + WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + Licensed under the Universal Permissive License v 1.0 as shown at
> + http://oss.oracle.com/licenses/upl.
> +
> +License: GPL-2 with Linux-syscall-note exception
> + This program is free software; you can redistribute it
> + and/or modify it under the terms of the GNU General Public
> + License version 2 as published by the Free Software Foundation.
> + .
> + On Debian systems, the full text of the GNU General Public
> + License version 2 can be found in the file
> + `/usr/share/common-licenses/GPL-2'.
> + .
> + NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> + .
> + Also note that the only valid version of the GPL as far as the kernel
> + is concerned is _this_ particular version of the license (ie v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +License: LGPL-2.1+
> + This file is part of the GNU C Library.
> + .
> + The GNU C Library is free software; you can redistribute it and/or
> + modify it under the terms of the GNU Lesser General Public
> + License as published by the Free Software Foundation; either
> + version 2.1 of the License, or (at your option) any later version.
> + .
> + The GNU C Library is distributed in the hope that it will be useful,
> + but WITHOUT ANY WARRANTY; without even the implied warranty of
> + MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + Lesser General Public License for more details.
> + .
> + You should have received a copy of the GNU Lesser General Public
> + License along with the GNU C Library; if not, see
> + <https://www.gnu.org/licenses/>.
> diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
> new file mode 100644
> index 00000000..a04ebfb9
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.install
> @@ -0,0 +1 @@
> +usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
> diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
> new file mode 100644
> index 00000000..22cbd6eb
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.lintian-overrides
> @@ -0,0 +1,8 @@
> +dtrace-tests binary: unstripped-binary-or-object [*]
> +dtrace-tests binary: unusual-interpreter dtrace [*.d]
> +dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
> +dtrace-tests binary: executable-not-elf-or-script [*.d]
> +dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
> +dtrace-tests binary: statically-linked-binary [*]
> +dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
> +dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
> diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
> new file mode 100644
> index 00000000..7696583d
> --- /dev/null
> +++ b/dists/debian/dtrace.docs
> @@ -0,0 +1 @@
> +usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
> diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
> new file mode 100644
> index 00000000..6be68ccb
> --- /dev/null
> +++ b/dists/debian/dtrace.install
> @@ -0,0 +1 @@
> +usr/sbin/dtrace
> diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
> new file mode 100644
> index 00000000..11005f4a
> --- /dev/null
> +++ b/dists/debian/dtrace.lintian-overrides
> @@ -0,0 +1 @@
> +dtrace binary: unstripped-binary-or-object [*]
> diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
> new file mode 100644
> index 00000000..e54b52b3
> --- /dev/null
> +++ b/dists/debian/dtrace.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtrace.8
> diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
> new file mode 100644
> index 00000000..b5e66db5
> --- /dev/null
> +++ b/dists/debian/libdtrace2-dev.install
> @@ -0,0 +1,5 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> +usr/include/dtrace
> +usr/include/dtrace.h
> +usr/include/sys/dtrace.h
> +usr/include/sys/dtrace_types.h
> diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> new file mode 100644
> index 00000000..36294de3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.install
> @@ -0,0 +1,12 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> +usr/lib/systemd/system/dtprobed.service
> +usr/lib/systemd/system/dtrace-usdt.target
> +usr/lib/systemd/system-preset/50-dtprobed.preset
> +usr/lib/udev/rules.d/60-dtprobed.rules
> +usr/sbin/dtprobed
> diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
> new file mode 100644
> index 00000000..34b4011d
> --- /dev/null
> +++ b/dists/debian/libdtrace2.lintian-overrides
> @@ -0,0 +1,4 @@
> +libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
> +libdtrace2 binary: unstripped-binary-or-object [*]
> +libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
> +libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
> diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
> new file mode 100644
> index 00000000..fef53dc3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtprobed.8
> diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
> new file mode 100755
> index 00000000..69958dca
> --- /dev/null
> +++ b/dists/debian/mkChangelog
> @@ -0,0 +1,174 @@
> +#!/usr/bin/awk -f
> +
> +#
> +# This script can be used to convert the dtrace.spec into a Debian changelog
> +# file.  It is intended to be invoked from the 'prep-debian' make target, but
> +# it can be used manually as well:
> +#	mkChangelog debian/control dtrace.spec > debian/changelog
> +#
> +
> +function error(msg) {
> +	print "E:"msg >"/dev/stderr";
> +	err = 1;
> +	exit(1);
> +}
> +
> +BEGIN {
> +	if (!dist)
> +		dist = "UNRELEASED";
> +	else if (dist != "unstable" && dist != "experimental")
> +		error("Bad dist ("dist")");
> +}
> +
> +/^Maintainer:/ {
> +	sub(/^Maintainer: +/, "");
> +	m_name = $0;
> +	i = index(m_name, " <");
> +	m_mail = substr(m_name, i + 1);
> +	m_name = substr(m_name, 1, i - 1);
> +
> +	nextfile;
> +}
> +
> +/^Name:/ {
> +	pkg = $2;
> +	next;
> +}
> +
> +/^%changelog/ {
> +	in_changelog = 1;
> +	next;
> +}
> +
> +!in_changelog {
> +	next;
> +}
> +
> +function lineWrap(p, s, line, len, l, n, m, i) {
> +	n = length(p);
> +	line = p;
> +	len = n;
> +
> +	m = split(s, arr, / +/);
> +	for (i = 1; i <= m; i++) {
> +		l = length(arr[i]);
> +		if (len + 1 + l >= 80) {
> +			print line;
> +			line = sprintf("%*s %s", n, "", arr[i]);
> +			len = n + 1 + l;
> +		} else {
> +			line = line " " arr[i];
> +			len += 1 + l;
> +		}
> +	}
> +	delete arr;
> +
> +	print line;
> +}
> +
> +function emitEntry(i, j, n) {
> +	# Loop through the contributions, determining who each contribution
> +	# should be credited to.  If there are multiple contributors, we pick
> +	# the first one who is not the commit author (if any).
> +	# If all contributions are from the commit author, we do not emit an
> +	# explicit credit line.
> +	for (i = 1; i <= lc; i++) {
> +		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
> +		sub(/[ \t]+$/, "", lv[i]);
> +		gsub(/  +/, " ", lv[i]);
> +
> +		cont = name;
> +		if (match(lv[i], /\([^)]+\)$/) > 0) {
> +			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
> +			lv[i] = substr(lv[i], 1, RSTART - 1);
> +			sub(/[ \t]+$/, "", lv[i]);
> +			n = split(auth, arr, /, */);
> +
> +			# Find the first contributor not the commit author.
> +			for (j = 1; j <= n; j++) {
> +				if (arr[j] == name)
> +					continue;
> +				cont = arr[j];
> +				break;
> +			}
> +			delete arr;
> +		}
> +
> +		# Add to the list of contributions for this contributor.
> +		if (cont in map)
> +			map[cont] = map[cont] " " i;
> +		else
> +			map[cont] = i;
> +	}
> +
> +	print pkg" ("vers") "dist"; urgency=medium";
> +
> +	# First emit contributions by people other than the commit author.
> +	n = 0;
> +	for (cont in map) {
> +		if (cont == name)
> +			continue;
> +
> +		n++;
> +		print "\n  [ "cont" ]";
> +		$0 = map[cont];
> +		for (i = 1; i <= NF; i++)
> +			lineWrap("  *", lv[int($i)]);
> +	}
> +	if (n > 0)
> +		print "\n  [ "name" ]";
> +	else
> +		print "";
> +
> +	$0 = map[name];
> +	for (i = 1; i <= NF; i++)
> +		lineWrap("  *", lv[int($i)]);
> +
> +	delete map;
> +
> +	if (m_name) {
> +		name = m_name;
> +		mail = m_mail;
> +		m_name = m_mail = 0;
> +	}
> +	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
> +}
> +
> +/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
> +	date = $2", "$4" "$3" "$5;
> +	i = index($0, " - ");
> +	vers = substr($0, i + 3);
> +	name = substr($0, 19, i - 19);
> +	i = index(name, " <");
> +	mail = substr(name, i + 1);
> +	name = substr(name, 1, i - 1);
> +	if (name == "")
> +		error("No name in: "$0);
> +
> +	lc = 0;
> +	delete lv;
> +
> +	next;
> +}
> +
> +/^- / {
> +	sub(/^- +/, "");
> +	lv[++lc] = $0;
> +	next;
> +}
> +
> +NF == 0 {
> +	emitEntry();
> +	date = "";
> +	next;
> +}
> +
> +{
> +	lv[lc] = lv[lc] $0;
> +	next;
> +}
> +
> +END {
> +	if (date && !err)
> +		emitEntry();
> +}
> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> new file mode 100644
> index 00000000..d4a89bb9
> --- /dev/null
> +++ b/dists/debian/patches/debian-configure.patch
> @@ -0,0 +1,17 @@
> +Description: issue a warning for unknown configure options
> + The Debian build system specifies configure options that are not known to
> + the DTrace configure script.  They should not cause the configure script
> + to abort.
> +
> +--- dtrace-2.0.4.orig/configure
> ++++ dtrace-2.0.4/configure
> +@@ -172,8 +172,7 @@ for option in "$@"; do
> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> +-        *) echo "Unknown option $option" >&2
> +-           exit 1;;
> ++        *) echo "Unknown option $option" >&2;;
> +     esac
> + done
> + 
> diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> new file mode 100644
> index 00000000..58bea538
> --- /dev/null
> +++ b/dists/debian/patches/debian-interpreter-paths.patch
> @@ -0,0 +1,107 @@
> +Description: fix interpreter paths in tests
> + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
> +
> +--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> ++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + [ `uname -m` = "aarch64" ] && exit 0
> + exit 2
> +--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> ++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + [ `uname -m` = "x86_64" ] && exit 0
> + exit 2
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_0.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_0.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_1.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_1.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i0.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i0.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i1.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i1.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-assoc.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-assoc.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-gvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-gvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-lvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-lvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-tvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-tvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.ifdefincomp.r.p
> ++++ dtrace-2.0.4/test/unittest/preprocessor/err.ifdefincomp.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> + # supported, we have to sed it back again.
> + s,[??????],",g
> +--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.incompelse.r.p
> ++++ dtrace-2.0.4/test/unittest/preprocessor/err.incompelse.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> + # supported, we have to sed it back again.
> + s,[??????],,g
> +--- dtrace-2.0.4.orig/test/utils/clean_probes.sh
> ++++ dtrace-2.0.4/test/utils/clean_probes.sh
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + TRACEFS=/sys/kernel/debug/tracing
> + EVENTS=${TRACEFS}/available_events
> diff --git a/dists/debian/patches/series b/dists/debian/patches/series
> new file mode 100644
> index 00000000..6d3b5413
> --- /dev/null
> +++ b/dists/debian/patches/series
> @@ -0,0 +1,3 @@
> +# You must remove unused comment lines for the released package.
> +debian-configure.patch
> +debian-interpreter-paths.patch
> diff --git a/dists/debian/rules b/dists/debian/rules
> new file mode 100755
> index 00000000..8646ac1a
> --- /dev/null
> +++ b/dists/debian/rules
> @@ -0,0 +1,24 @@
> +#!/usr/bin/make -f
> +# You must remove unused comment lines for the released package.
> +export DH_VERBOSE = 1
> +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
> +export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
> +
> +include /usr/share/dpkg/pkg-info.mk
> +
> +export DEB_VERSION_UPSTREAM
> +
> +%:
> +	dh $@
> +
> +override_dh_auto_configure:
> +	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
> +
> +override_dh_strip:
> +	dh_strip -Xdtrace
> +
> +override_dh_auto_test:
> +
> +override_dh_auto_install:
> +	dh_auto_install -- install-test
> diff --git a/dists/debian/source/format b/dists/debian/source/format
> new file mode 100644
> index 00000000..163aaf8d
> --- /dev/null
> +++ b/dists/debian/source/format
> @@ -0,0 +1 @@
> +3.0 (quilt)
> -- 
> 2.51.0
> 
> 

> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

