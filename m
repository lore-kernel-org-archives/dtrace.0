Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561847F47B
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181983; cv=fail; b=Qcx7Cog6PH14nuoNDxswEF6E3x0fdROIjSaHSs8uHqR/TyoUNr8zI5umS97hVbvze2EmWO85oNsR9J9OctGiIzm7+eFUQNg0x/l17tZPTjrHCIq/ljHc2YdfOHa27cO9tFlPxMCVpOsWAL7epyku42e8QHEAJZTtGwiIudQ/Xyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181983; c=relaxed/simple;
	bh=wTcODlzlYxc3fyRP2RC9P8g9ZKOkgPC2ioew4e69oqs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DNPHFVha+dm3Kq2DxQzN3Dx3Yu7T6BHtuHAZAxFatfCw/WHIUt6iNLfJhueV5tRaHb2gvVVSf6LUoybK5n8LQf/OhMXHRDCJdkpFAYVjT4htqCb8WAznnPXyi+BO1GkHykT6n8r+kk+Dp3lhlYqAVZpc5/kqueTDyWzUsteEQhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VITZJn005540
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:39 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:message-id:?=
 =?UTF-8?Q?mime-version:subject:to;_s=3Dcorp-2023-11-20;_bh=3D1j+JswcTf+3f?=
 =?UTF-8?Q?8Mw4uWzApSvy/CqHy+WrlQHGO9kGevk=3D;_b=3DM24C5vofCWaJEw1+c7jMQmL?=
 =?UTF-8?Q?zoNT7GQb64OVdc+6/EG0fDa+bqrAjOYRrSqzhvpVfIzP1_tu5RQnLTUGwL+lgmX?=
 =?UTF-8?Q?AClXyfFbkDBcryg8Oc1Z1YLPaO06XIKBvZl4s63mW8siUvrJMKI_scSX1PEKg6C?=
 =?UTF-8?Q?2SD1+4wDH/AgUuZdnPdaxr5Effroj8pFUqeLRTcEYpseoM6G3z+ZXKVJo_HZKFB?=
 =?UTF-8?Q?IejQhw5nzmmXyUUSsQpGb3+0BeRRgzLo5kMpJoU5dsDc0Mc6688DSzSMxDTgAfi?=
 =?UTF-8?Q?_dlgRhooH2hSAUeL+QaB0dh8UcFJJq5xxDG7KqEDo1fJpgB68r9MnB0VsfxoOzQ?=
 =?UTF-8?Q?ae0kPd_9g=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g4buer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:39 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIA1eo024001
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yc52fjwv0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9MlCr9WzUvwKngNGrEz4D3+jjJT7fL72QpZbNdKKEZl3cLdmh9VFPqX7dagL46nnM2grsK/Ft9HmMopnuGfylbWGyaS5y4FS3ITcjydI0dnUZ1hAqYySrrrN8y2S1pdAGGhMfJs27hC4vUeI+W8IHZpwDfNW+3uWJHF8KQh7JOdgfesZWKp6FIu1AIkItLEDPM+vUoSoT4x9qezYh/pWOsKP2C42Ft7Gx4Gt3msTKTFW3T9XqO1q+Eyg0HSyR8UZi+BxYDRyNvgERCoWk/+SHwhmxhu0gET0a3/pW0YgfxjKo12cmivzVDFzDjOLfgqXZlaH4vMeZBOQJjngrTuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1j+JswcTf+3f8Mw4uWzApSvy/CqHy+WrlQHGO9kGevk=;
 b=dZdjhd+2QmVr8Ia7qCEsD8zAt87PqvivekZMwkXmeTMT1+S5CgXOoP6YR5XT1z7kcR2GOXm8JtwJyP6Q6ySyBubfp8IryVGPyZjC0YjIz7v6ZIeSIdE0EcDbaigZSSw44wqaakf0zpoAHUrXz+BMdy8x0zJhCs+5D8l5J/dWB1BG9jR6nPzPuvvR7uU2O6nxaURC/JCoydOZQ6UFR6L3UWF9WKlH01JJTkAvMVDHUyyKXQIoe7f5e4raYcbKvAD5L4OmwxrhZLZeKKIWs8Ko9y+UiCnQApkqMH+aZrUjYGlPoRC2BaYc7ZqOroBWGaxA2tmlz5ZJ7a8s3iwaykJavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1j+JswcTf+3f8Mw4uWzApSvy/CqHy+WrlQHGO9kGevk=;
 b=vU1JUaJM4FqXXkZ04B5o+4oyYSQMxPdTjzPQZGkQ31ofFs2m2QmDjWCCadGmUCyyQzU7FgtvPoS62XNKcvLE0DwTDdqO6+YVoZqs6AGYs6Ur6CtZhXyuS/itbsuwUx4g0MeN2Vvcpktp7S7ecH+Cl6Fyt6IqIPvtArk/PzLnYlg=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:35 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 0/9] relocatable DTrace
Date: Fri, 31 May 2024 19:59:19 +0100
Message-ID: <20240531185928.363245-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0456.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::11) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7df91b-7f6f-415c-e44d-08dc81a3d057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ua/sD6TOq745ssUaff6COySglNTSY+1fS9M3IwOqZ19jZWhZUpqgWMGDDI40?=
 =?us-ascii?Q?Ar1SNKvIOf66020fyM/NBuaaqqnJVziB3FOZbH1KZ+9x9Q1LzZUUArsLkU0l?=
 =?us-ascii?Q?Y0Lv0Okln9cwjRlqdoWZnZ+NXwQcjjtW0PeO/uu4+9/OViVHgFZVuBLjnvEE?=
 =?us-ascii?Q?mq+aXL6XN4rIvGlnLXUzgzEB7q7w9oBw5xmdX2F9CL05cT9xdIZz0yFxrrfW?=
 =?us-ascii?Q?WIK5RLjMO/Q6oRDS8BO08AswUlqdiSCPaF2KS1t1ioQQf5F4PkdX0dFkg8lD?=
 =?us-ascii?Q?kL5NGL8B4hypAqKWNKbxUAb0G+kEngMuLlPc0UN8iJGc9tbhllVlwwSqJ7wF?=
 =?us-ascii?Q?pq85NRRs/yAqwzdV4Oo/FGT6RzzKbb0h8mHMMHx46tAZB4qTEURDp3B/nPQu?=
 =?us-ascii?Q?X3/XWGqC7swYuNudBZWW7uZjDI6GLAWBsNnD26XvBpfygNNPYrPw8I4MdAOZ?=
 =?us-ascii?Q?8qNb8MiqnduAX9sDqmrRuIcAdyqOQXk9qBjp3YZWecSIao4ATzWPCXqh2YoI?=
 =?us-ascii?Q?api+cZMB6XwARlQEtAnHgSniAoy9xm5O8cgRpxOIuKHiI6VkpYVPTj9EXW1X?=
 =?us-ascii?Q?qhx4w/ko6iqxP3yjHnPwqcbCilYyOkn8SZKreWKElFRLADqYi3DoeuPsVayS?=
 =?us-ascii?Q?m29wIfOtGRehy87i1mSl62Sup0nzMgXlhb0HEgmk9MSXPjTg33CfU84FP1rn?=
 =?us-ascii?Q?YLR+4FTMbr3C/27tcsr0LjlCngwDia1cFWivQXZvWbdfIQDDPEv7wguQFkc7?=
 =?us-ascii?Q?aoSMIL2kHI2cz3YkBUG8cQlwx7o4GSguNqfG6+OKzPtWfNvFhPrAChuHllbZ?=
 =?us-ascii?Q?CY32brvv1a09W3CAMWGVxuK06hKjr/ejjDQH96Gw8DVBSUVxmLN3qtg3a6Kl?=
 =?us-ascii?Q?+KfONaGGCDlfiqn7GfnPApeFcZqQJLqnjs+IItBEw3UqiLT8/XA51g6eaOcV?=
 =?us-ascii?Q?QkTr4cY3sfQRok5xsBWFoZR6sr+o+/rehDqLVT1yC7eh0jdXLyGcRU1LSFA9?=
 =?us-ascii?Q?8rskJMr3IbKZzXqajo/JpokmPZ6ytuL4a0wzy09bid4dcMZHAlVhjVXk/GUp?=
 =?us-ascii?Q?GoYPo8Fh0suQZZP0SV6CwUrSsDw/NfZRksJBz5M5ZHBDX2at/lc5+0dFIQbd?=
 =?us-ascii?Q?WZuj8khOmMqZ32xD1PCYqE8fwb5/k2yNhHURAX8DBrO1KyQAm//66mVLlH5J?=
 =?us-ascii?Q?SRr/hBwJrG3eHXOIAfN7+dyWV+Ifq+CQylEN/Fw5Z4uMw53tz/GC3tNqx8NU?=
 =?us-ascii?Q?UvnH3T/brxBvgjfFm9efT8WHKJ8TL9ccadNeVT708w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SdoNpLs4SQFpKm1ZNSOs5SfAu1DvB1P5SLNcj03z3mvh7oNWBuf/3HlFjGue?=
 =?us-ascii?Q?NlvdSDuh4H380pEmJTEl2x8j3DNJjkmxTT7/3QkkVbXjslT4OTV1f/zAJ8SS?=
 =?us-ascii?Q?qGlS6HHmpxqFQVVn6/p6Ncf0e1xbuhdToOaPu2Gj0eHD3O8/tAttDLDmFCdq?=
 =?us-ascii?Q?At1avxtfjHCHfsfO3derVPh38RMple5DNltJAaGyp/01l1FBDNoH8HvtLnP9?=
 =?us-ascii?Q?VdKBBAZhBfssY1g8x+vwUxl2KqTArd2j/0qYmXY7Ob0KoAv+qEX7+veFBNJE?=
 =?us-ascii?Q?7hT41FD4qDOsn5j0RXCLs2ChIm+Rqvx99QqPgKRGYd+6j6KbWYRXrRt3/AxF?=
 =?us-ascii?Q?3qD8yFm+ZScMVk1z9WNrfvAL9AKRkADQxxo3sWNr22UCTiZBdRPgd5wZgMtU?=
 =?us-ascii?Q?yxYUJlT46VGaWj0BzDvlgx9UTmAxnL414BI6Ubfvy7fF0e8JT/DR7WOgqFb1?=
 =?us-ascii?Q?WM6CnVNqsj0p0F9t7WxEryAHVafGgv/7jE5Ok10CFWll6JF2U88QkJZ7CaJ8?=
 =?us-ascii?Q?fMN7Y6Bw/5JQb3sJWnFEoJ9wqqSdntFpucjTciNKg0KAROENdMWjoKkFgdix?=
 =?us-ascii?Q?ByyqjUnqHE69BhxLA5MASI7H/4DPhFW9WGqhPMeQMDjIPIs9vDTBjLwDQ2MG?=
 =?us-ascii?Q?jmqrX/HCtpkmaVjsG21+KYM2md+jI/IZ1q/zFleyxpQQtun3gL3tWeXGMrnj?=
 =?us-ascii?Q?udr2FwteRpyPhHBnDvhPhYp3gPGnpYkBP8uvKpNkTHLn1PiR1Pt7gPYhrL8L?=
 =?us-ascii?Q?BgtABCapWyRF+lyiZmcvQzWz6JEp3B17uM5yKmO1Y3dB+6GhpnuJv4Jpamcy?=
 =?us-ascii?Q?aCtUIzuVmosGMKruPmZAZvD4c71EfsdAESFsZD9cu4Y/yt1Vwcwf/rDylgOk?=
 =?us-ascii?Q?zos99B96s6eo1xZzljBTlMwoCfnyY8KOB2NJeBMpJNuf1p7URejajsrU4oow?=
 =?us-ascii?Q?3qO34Gga63mgM9oU24peEhm5141/OzU39c8MHS9BX2z3J0J2/HPJ5Na97Ix0?=
 =?us-ascii?Q?XY2GhOX8x3l2OqDPvEO2MOj9UAkCaqC0GpHmXCASqgfWxC7Mk5fJ+VWIkFwm?=
 =?us-ascii?Q?OmaOxlV5cI9S/9u1JX/uerxWQ1Hw0GeojCCdsNYqft277SiQTubMr4fd6jxv?=
 =?us-ascii?Q?o36WpjqnQSWOIe3TWrg3ixnZOTH1X1d0CY0mZ6UvmaC7V2nyFqEEpjZ2wXkG?=
 =?us-ascii?Q?WbPCn1tcO+5wi9WH3dF+1XPFHHsKjabJUuSSRkLgkPuuv0U2RPNXCvxiZuT2?=
 =?us-ascii?Q?Y7cXh2CUDSDN0DR4yMGbEMoO4PqMLvtN00Ww5wlEEUeKMaP6F0oHYqgrtyYG?=
 =?us-ascii?Q?5YlFsln8V1EFUUjETyGIA2VgnlDLySi2JXO2u5exTEEQLWiqON+T8y5L2B5Q?=
 =?us-ascii?Q?BE3fL8wjgHBBJoY7yW78jPxXTMvkFqNXzXAn7QVkHLgl/FcOsQQthiZUF4Hl?=
 =?us-ascii?Q?upBGFKUlADex3f9BYVEBx2b604KW7AoVZqhSOnznaRGOo25OxumqNH7BGM5Y?=
 =?us-ascii?Q?tkEwhlvOT6SGuWbfZVy+YqJbd9z8mMCiC3uLKPdWyOdKnURJZe2r/TefUHJf?=
 =?us-ascii?Q?JW50bkEqQNAb+Y/AvG4uDUpa75hub1PrLpqGRqlXYZ43Lp1ldlKPvok7aP/0?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6QAypu0iYPLazF3Q3jwIFtuvSXSbulXVL+PpLEDc9R+qfn8+HyxjZBG7zKAogkLacrILzT6b0dkXJnu0NQwzSgl+aXGW2tmyCwys6E78W/xaYcwwTZE63Glnq1KCCrulGJ3cxoPMNRJCLr7EUK4yBGiH15jRCv8lFwhhrL1p05acH7I+OFLSCtwOoAqH8GU8OifGhQD8/vEq2BFs53PHPPXD1qx5q3E/D+wVSKI5HQvK6ub5ldBsu0oU2hIesSetT0UEI+fOv5SCe+v8RE0sCZoiUaQKWxWuiYR4M4VZsGZg0A7GlaQhJa+BJXocpMYUK5qG/BEY7idj5SzNQFQTmfhhiJ/6YIYExbMugy4wqyDGyTJX8pGdbQfM7dbfpwIamPLuCUv6k3KPQGahSPkH7GEY/mpuhigiXOGSBwN9IO5DTZZwLC5dwdqMIAXSwj7y3RcI7UdpF42iS24F+bylvvBlevKiiJs8kgsAGkLjLytF87n79MQYzCsUj6FureaZnRe3qhU2eU6XlNKEuCtElFvPYsSZJPAVUXnMkYXFfKnioJn+OXYCMyndT7ICAS1n7KKrrnl7g1UzGd5simZcJ1Ej6HXwKZdtmclYJhqBBBk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7df91b-7f6f-415c-e44d-08dc81a3d057
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:35.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIeOziOJEsAwcCO6wPPiLKZanAllGV7oHf/+ko6goF9XUiS3G+WU1fa+zEcFrR+fHfn+mLB5GnxuycotwbWgwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: PWREMVA-teT84dmlbEWbvN98psnlp4C6
X-Proofpoint-ORIG-GUID: PWREMVA-teT84dmlbEWbvN98psnlp4C6

This relatively simple patch series makes DTrace work with non-default
(s)bindir, libdir, includedir (changing the other installation-directory
variables largely worked already).

We add a pkg-config file named dtrace.pc for the consumer headers
<dtrace.h> and <sys/dtrace.h> and for libdtrace.so: I expect there are
no users of these outside DTrace proper at all right now, but providing
this means we can point future users at a suitable pkg-config file so
they can automatically adapt to dtraces installed wherever you please.

There is one wrinkle, which is that the udev and (especially) systemd
service files for dtprobed have to be installed somewhere where udev and
systemd can see them.  We emit a warning if they don't end up in either
of the two fixed locations where systemd looks for such things, unless
the user has explicitly passed in --with-systemd-unit-dir=, in which
case we presume that the user is doing that because they know that their
systemd is looking somewhere else too and is pointing the DTrace build
system at it.

(We add an extra makefile target to allow users to forcibly install the
systemd service file even if we have not installed it by default because
we think that it won't be used. Users/distributors installing DTrace in
--prefix=/usr or --prefix=/usr/local will never need to worry about any
of this: in these cases we install the service file as before because we
know that systemd will find it).

(The first of these patches has already been submitted on its own,
but this series relies on it so I thought it might be clearest to
resubmit it as part of this series too.)

(Multiple test runs with non-default values of prefix, sbindir, libdir,
includedir, and systemd-unit-dir passed OK with no failures I can
attribute to relocating things.)

Nick Alcock (9):
  spec: install sdt*.h in /usr/lib64/dtrace/include/sys
  build: initial pkg-config support
  build: track configured vars
  build: --bindir is supposed to be equivalent to --sbindir
  build: the TESTDIR is relative to the LIBDIR by default
  build: add a pkg-config file for dtrace consumers: use it
  tests: delete the kernel build dir stuff
  build: make dtrace and dtprobed relocatable
  test: work when relocated

 Build                                         |  1 +
 GNUmakefile                                   |  6 ++--
 Maketargets                                   |  3 ++
 cmd/Build                                     |  4 +--
 configure                                     | 11 +++---
 dtprobed/Build                                | 36 ++++++++++++++-----
 .../{dtprobed.service => dtprobed.service.in} |  2 +-
 dtrace.spec                                   | 23 +++++-------
 runtest.conf.example                          | 10 ------
 runtest.sh                                    | 33 +++--------------
 test/unittest/usdt/tst.manyprocs.sh           |  2 +-
 test/unittest/usdt/tst.multitrace.sh          |  2 +-
 uts/Build                                     | 16 ++++++++-
 uts/dtrace.pc.in                              |  8 +++++
 uts/dtrace_sdt.pc.in                          |  6 ++++
 15 files changed, 87 insertions(+), 76 deletions(-)
 rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)
 delete mode 100644 runtest.conf.example
 create mode 100644 uts/dtrace.pc.in
 create mode 100644 uts/dtrace_sdt.pc.in


base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
-- 
2.45.1.275.g567cb0950c

