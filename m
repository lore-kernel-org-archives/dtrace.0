Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AC221F20
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948214; cv=fail; b=PxA4GmkAvY5mJAiysqcKFQLAyvvLrmdrIVs912ikXqzSj/CUaa62FyKcmfjLL1LHr+uFkOHfmOkJqdDCpFLcOKHhj4kgHs2WjBrTX1KmeNConPPF4ZTEg6aa0lX7Ho6puT0wjkf8LV0PqubrVDsPaynY6hZBgY/RIy8i0RghVzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948214; c=relaxed/simple;
	bh=AyhOhAuNcOyxGJG5aFZJjjigr66sdeB9652rb1lRZS4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=axJxLJiBX8fHs1WJR2jooZXcQMSYTP7TJk4nqtJKBtzLuigxXEM7KiuwsvLjGFUbiYgmHpqZ2mq+NYZ06dX3mwraGn9OBZ4PJHNOwZQe06XX1sPlNSIGKCc/40827hd5BfJm8wDO6D2UVO+JwicDixaaOY24v/JCU8LwMw9MEhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xqtd5iA/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zLRIOwd8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xqtd5iA/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zLRIOwd8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH0uInu1620222
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RuO7UEnlTezck8t6IjGmNWBpEzqorHQxRQwBPS8BFOI=; b=
	Xqtd5iA/N6mkvPHwzSgoQ12Q4yI2CAb/itBeYOtQZX6rUFHw0iZBzhLrZht7B7Fh
	5I+t5rnyZZWtSeeGs3kTCAhu4rh2YcU+o6yEunWxtfgWiLOiXC7I29UsR2LHOfBg
	WZ6/Tlpt0iMtTjvwJ+CtvI8z9KQS2a1Ey/K3nIxYvbnetnb6JI/GT71SpG1QLmR+
	UEnQVpalTbqPVlNk181g5coBctmXsJo5v13H6sZAAgyMvIpRMlv5KH8rXPXfqAbR
	qS11KeqJKcvL6IXkSayDhlTWhlRAb+LWoBlikdyVDcCynC3yrsVQBNEFgp8OAt/5
	Ojq3jy/GGgt2ZBYfuFakDA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0yrun5cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH4ZTbk022508
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:03 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkm4cxf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJSjeTj8Bcr4rPzjSDm7ssoN+PVlP9lS3uBTsne6e/9NL5+z5COvP+RtZQhpyAznVC/uBv3T/LDzKhS85F1m8aZFeoq6Y4MTSLhz/Jc/rL4Qm0Nd8oYvXmfXAok4LiSOFfPs6WStgtGuVuRvNRf7gfshsqRvaY1wJWk6GwY6QI5V+oQuw5yu8OQHCoe5i19wlMzH5GQc6gYJU7v42PeNOed1VCiJiyI9c8whaqtIrdg4xXzb20SdFRHAczvySF3Jm7iyiMOlWrk3Q2JI9eHm4X1MENWawJAoVpy+THcC8vtWCV5CcRpLfCTjL/X9E8SncKDqLuwiBsshDhqmshBPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuO7UEnlTezck8t6IjGmNWBpEzqorHQxRQwBPS8BFOI=;
 b=YE8h7vw+QFiVPVhvoRYfIaWJ4gdjklwzL3Hkr5tc9Dn3mxhEp2zQdw9/OehI74gssWvULHqfdMnSaF2e9CQoba2hmXa2RvZEr9tg5pyYa3eKddM+p1WgBDmSF4Bjev5tAeY/mqvDfSBtMZ2AQPonCbmdEDJeL/gG5vJklvc1Jup1Tymz9Ppyc6NoXCvbu+UbwMfK9Y7/xAXpSHK7BArv8wmjxNh+3AmKgauTmJ2VF34qDNOXgzR49rEOv4dCLy0FR9slp6Wa0YjqViI5Z6su64ZE/hAt0jpdTVqQkFkBHgcw/7seM5ojMFz+DrUhXQlo9exeLBjRd7QmbvuKe5BYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuO7UEnlTezck8t6IjGmNWBpEzqorHQxRQwBPS8BFOI=;
 b=zLRIOwd8YBORXacTqMJ2saAzRtrc+gW1kkT3NfwXp3H1gbKlpvw/fYAbLBxAJxwOx0aX68WYq7wNvSdQfy7/XWFPzKolIiW3Fydknz4Sd6r3OA7/fQbXuWsb4rA790VaqNnTMH5ydV3FwKXvCVmZWKiLAhJTzV0GmrK8Zw9MpHo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF61A2638A8.namprd10.prod.outlook.com (2603:10b6:518:1::7a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 05:10:00 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 05:10:00 +0000
Date: Wed, 17 Dec 2025 00:09:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] test: correct file permissions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF61A2638A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 34dd893e-3d2b-461d-bb81-08de3d2a87a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTvs830NT7p6JpjlEYSiUfaQfTsimgRWiM66OjA9ugG71kIKZSP4oCA68E7F?=
 =?us-ascii?Q?lK0GYHpVyqHin9djXCONU+Rcc/vrkeoyvUvIo3Zr3xWVtz0p5IAOQ+VKlmfR?=
 =?us-ascii?Q?RRlpNd3qK7kt+76nZfGiHC4jXvSwt4DnZUZCYt4VtuYWpWdQu/eVU5u/Etyc?=
 =?us-ascii?Q?iP9j/vM5jjS0TPBAcMPpbsCUgC4b6Jf9x2h138gFTkwZPsZTtyaQfFl+6k89?=
 =?us-ascii?Q?I0/mNC5AIbCV5ff10VBjPtMIjKh5/WQWX5SD138w9gNRocX1XHdj9nsHzLbC?=
 =?us-ascii?Q?c+/RgRL3c1zlK2tuqCshd3LLYTzHg5BgIT5wOeynMO4/iueyy239C1HFkguk?=
 =?us-ascii?Q?GJrtYsCFUeDYkMc3mQuW4zk+Uss1P5BC3JM8VYS4UCWQgsFPr9JZ2kTvnlu2?=
 =?us-ascii?Q?LVSYEVEcrDKj886/cLo44w0eGyf/hXMeVs++77WtmR/qNqpGFlPsiQP1tKf8?=
 =?us-ascii?Q?V5xXsLxL5qz4Q+Yh4FJ5ky4WEcEC/s6NIJc1OMZl98kZ41pbWg2VpH1efDL5?=
 =?us-ascii?Q?NuSpHw+C3SFITZDBot0VyjK5EUpmVCCDFnJ75Xa2FZZgtIQmFZWrEZqqMeWw?=
 =?us-ascii?Q?7+S6FC0F7r7Jo0LUPAQCYr2/Ho+5P0N1Broe3gX+Q0cH5MxpCumspFXjFwlT?=
 =?us-ascii?Q?b8P4PeVzkImNbOLM+WFiKnZeJVqCI9xrKn4Fu0lgh2TjUC3HqvCU0v8Chz/O?=
 =?us-ascii?Q?eJlqU2Y0nR7YWC32RQUaYGM5mrHN9PLEVuTCJRz4QJYsib712QXim7Q5fZao?=
 =?us-ascii?Q?lgEmDegJUvjlmdzi7FRX/BMPhqfEcFYAUtzSzx0OjrL8K4qZQVhlE/FGyfSu?=
 =?us-ascii?Q?yv/yYWyfq9KeE/tztznsgvZVm/C0SAWpxle6e2C7HUDfQAtBSm2jvmZBaYMT?=
 =?us-ascii?Q?HcdUS8ywMOxwXyXHPLOdCADufG7Mk+GKD+MPF080/PrdsHiCkN0ohu6t15Jb?=
 =?us-ascii?Q?IuSVYUxI2WfOwWGjpP11qH5AkRk+v/w1rd5/lLoQDbl4Lo0SEd93aAGvbDbV?=
 =?us-ascii?Q?2Ad4N3iVKleKfdHRiB9cGMQrOaaOs69SLYtsi/KUYnBOEL9JngFsAByQzgNQ?=
 =?us-ascii?Q?TvgUgc0hg2ZCZjrQt6ACLdO6Iq/6jio6v/LNeFlrnm3uhustNMn1/XWPC7Ma?=
 =?us-ascii?Q?5TppASBUli+9MrTib9Bja1g51HvVCmLvppGQLz5fhQQlciqXyJpdU2k3Bjvq?=
 =?us-ascii?Q?/hEugf+UkIVeIhqUThwGR/slwjJM78zs5EPshBSadvWTHSnH0OzlvGmenxxe?=
 =?us-ascii?Q?X7FruEemMl6aPJABeeZW0/dTpXCyyavcj2kdEbzZjVEF+7n3wBJX2BRqfEnc?=
 =?us-ascii?Q?oImtYt6KMQe7QPDuaxXS7pZpgUKPZs1RlBw5HRApz56nDgBKUXrLS+Xk+ZA8?=
 =?us-ascii?Q?aU9FXJxfi14oY6qw+834WRRwqKi2gkX4M0MMbxHMaGIgK2aMmFHU3gP07Yuw?=
 =?us-ascii?Q?jSpu24rVRQXFldqvKE1QjRzZ9hAlBu3y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5lNioWOGupKBIWjiqG1DXwK2aaAXVngSJzYU6SZC0tz/hMnwDhmYq6aeNmkk?=
 =?us-ascii?Q?RkzrdCkLFTv+SlYjIsaSH+ImZYSHskNigmp/vt367HCbeZIzRUu4TlwhbKp+?=
 =?us-ascii?Q?vzF8S0Evnptz3YbeRysTshsUQ7FKF+D6GYsTiGyLTivrDnd9SjmP98PrXont?=
 =?us-ascii?Q?5rmIiwbvVDGT+7vZz70PzG2hiTfwohXMZhU/sXRXpzMCvMKm1W8U3Lukyn7J?=
 =?us-ascii?Q?ej4tjs4ZRRWxM9JxmaEe2D6OE3gfernf9pBz9hxkobQtLoUbm5VEBC+vJYVl?=
 =?us-ascii?Q?WNH7+YK3Dugz5igFNtfJgX9jjL33gw2AqcVcpyaT77PxmiYbiwOGannLS4Hs?=
 =?us-ascii?Q?hHsw1rV6U4g6rPn8TKcEvPJklC+ezfBZQjD4e2uEyYBB4Ng5+FZeGpXyKJcA?=
 =?us-ascii?Q?noKA8nZvR2BksjMvhsq461i487YJKJuH3Q1S8eLgzX9MfYJQb8YDjDej6/Y7?=
 =?us-ascii?Q?4SI4Z1H6O/zhjJXUJqnoqP/9H13PBMk/8FQ1a69cauyOoHyfxdoqDvKLO6nn?=
 =?us-ascii?Q?LmntZ1IY9GVz9yTRe3tNmk4hWxxoDxJ5j6kjH3RPy3DLQVxp5oBIwcwHeTwi?=
 =?us-ascii?Q?AJRuvooKy7lok+4zQ5c19vSbBRy3t42duagC2gdHYypEwzoFA5HUR/eifJVa?=
 =?us-ascii?Q?bXOBzinI7yHPIX6PqqwoB1CIRAoWE8UnsSTQO9gQiL89DuS3s/9E0B5YC8VK?=
 =?us-ascii?Q?8VJ+iIeg20gpwvtbbvVJGc7/iXe1UTYQ1T3wUbYzcEH41CM1jRNg+7kmeNk/?=
 =?us-ascii?Q?fYOn+xBxRo/nLdCEzOyvXVS/+6+NXILokgjbFsKo6jdNVpqI9GkGXcJU/Z39?=
 =?us-ascii?Q?e15JOMkxjRnsmXekpboM9R4sOSX9Qcw6OGORhKu2ENETWtHilSphLlHx1xUu?=
 =?us-ascii?Q?83MVcqacUd9PFpzVOQ+T4vD1pMbWGbzkQrUMU/PQkF78/8usUNZCGgTSqVOM?=
 =?us-ascii?Q?nJ4GXtBRcxHvfyb6DKUxobQnBS+t2RtcsWuMKt1J4zdx4uYIbOFRjSajhrd2?=
 =?us-ascii?Q?yrc9z8O24nF+yB/tHOPHByxkN20dD2RF+M6CCE6X0kryKHCuS3Fh0rRl93zA?=
 =?us-ascii?Q?7qRpv5sck3OnTHJ8H5eparn92M0DtPy3vAiiT8sJMpj1kjXLHKIr0ENGmS/V?=
 =?us-ascii?Q?s4NKhESMrp1zdhmqfFILUG5qV1jphm2wGfyVuijPxfqkbzhAEMJ/xwdvn41P?=
 =?us-ascii?Q?pJqD7UMyWNpBHqNGJPZFCyql5WAjZ/kqkYsgiKQjTIxzKL1Qa4GQ0Zmh0R+z?=
 =?us-ascii?Q?IcxLRmCJRakMufz87d8B1SZDtSGhnkHD2AmnMPFiqqzCibFm72r5rPXG8kKC?=
 =?us-ascii?Q?de8H+6KbnFUm9B1MKeG1jLLG18OTKHMpi9Xgmj1djmYfdViyWbRIhE2Rvln9?=
 =?us-ascii?Q?qiv/CqKzZtYMgq1hhv/ovrmln8rkWTKzaENwH7EEPUdhKjl1x+5fUjOTggzz?=
 =?us-ascii?Q?HYqgu+kK/QrZe0rSdeIXO7lQbf0vH50JN5FydA1gOp7cA/TtGF4w2usSlFDb?=
 =?us-ascii?Q?PKzQ7YJg1KqWRWmbIuLu/A9fhHlO1hXgHl/x9bDr1kfArBSofbf1gzCPQXiS?=
 =?us-ascii?Q?C+aHXNJ8IgUJfVFDCwFDEW58dEizDlzL5ldYEuTPzJAmv3Z0nv0X5JbA2iyF?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VbNV2EpzwtEDSrR1AhbPFO10rTb30YXIMIyi06CV4J3F7szqoXb+ufZbXrbIdyooydSGwj2Nartr/IE/4+RMuYmVmO/0QNYO+0s2lXHelJOgJze/Da2edIFpgeSRTVzpdKk+n66m1rHWT32sG9J0geMCkacqlPory21Qeak6g3TTZk/yA3Zgc/WqpFAvUAPv0o0tZoUhpf4Rv3rlpuaEn+GsnB/X1I7E6HuRjDu29G1ZA/qXy0tXaBuMeklh8jjMISDLonxq5rDHw6ATQc/VeVdLKu0LsWGtBDrVkvyW+rnpiReq1be8jJzt84lycz1Er+1e/E/DjroIOzG4VmCkmXSaj0YatG4RedWBNSpoEXTJhmTjWotqwO9eLj+FSSnpy53KZF6PG+l0NZzLGXjYAAGbnGtInyvS3LwbfSfcXtaOMAyyLqIDMwx5gx/6iHwbjebcpKWmnOlolwmB2P6+BfxvJlLkypN2Ppo0X+KHy4yY4lv9DfgR+HUGty7Xb0EqDdH5Ppn4vU4TJ4CJ6feKEmu+DLtXbu5bxylrFZNuzvl9t1hOjHSQjkMa7hEcuE9nEPcxQjb9SZpnyjiaNM9QIQ+3Xuscn4T4p6JB/3C+a9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dd893e-3d2b-461d-bb81-08de3d2a87a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:10:00.7574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UN28fm6d6CvcPEgaOS5UWsVHs6BKANXDUoUyRQGjRFHt3TL3j/FLRDstmIU17ECE1a/euaGAJ7rJlFDBd517la5qznsISehjvwZUcHSU/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF61A2638A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512170039
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAzOCBTYWx0ZWRfX6oZN9CYPuHv7
 kJ4hhiUKigxRfkD1FWhbjTwub/9Il2oGZ2QnXkmB1WQSioTfB3K2OHdwumyYViAH0rN3PT81NQX
 U0yRqhiCLfZXQlmrfbIv0Fm/iX52rPvvplf8S4L9h0B6SuI7VsS72pPikukdKkiUXzxoWWRE0sX
 PKrYZNMvDlHgAXtf/oNFNFlKguW3k/LA65JDepWc3vtqXLHkiWO2G0r9sxXPJOxI5k8WM/y7Swn
 pL3DzV0Buv9cvwlTKoxLM/Tw15qs3WpwomxCXUmmmSI8o5st4NGgTD1u8dJuTe4cruZlOqIX/Ya
 t4TUmqCrYuWVNHZaq7Rq3ZEab2a2xnFfM87LD49TfSxnc44aiFVg7F83uFJ6t1BkdI+Gx1mzXnr
 SWY+2NZRAHMrb6zfzuI/upmf5L8AUxrEXWV908CKN69xyJkMWhQ=
X-Authority-Analysis: v=2.4 cv=TL9Iilla c=1 sm=1 tr=0 ts=69423b2c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=jdTEILUgIImYc_n-udUA:9 cc=ntf awl=host:13654
X-Proofpoint-GUID: tBBgi1C4fO405JtPIQ9VKRGM8-9SWenO
X-Proofpoint-ORIG-GUID: tBBgi1C4fO405JtPIQ9VKRGM8-9SWenO

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/script/interp.d                                         | 0
 test/demo/script/tracewrite.d                                     | 0
 test/demo/spec/specopen.d                                         | 0
 test/stress/fbtsafety/tst.vahole.d                                | 0
 test/unittest/funcs/substr/tst.substr.r                           | 0
 test/unittest/funcs/tst.basename.r                                | 0
 test/unittest/funcs/tst.index.r                                   | 0
 test/unittest/lockstat/tst.lockstat-summary.d                     | 0
 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d           | 0
 test/unittest/scripting/err.D_OP_LVAL.rdonly.d                    | 0
 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d              | 0
 test/unittest/scripting/err.D_SYNTAX.concat.d                     | 0
 test/unittest/scripting/err.D_SYNTAX.desc.d                       | 0
 test/unittest/scripting/err.D_SYNTAX.inval.d                      | 0
 test/unittest/scripting/err.D_SYNTAX.pid.d                        | 0
 test/unittest/scripting/tst.arg0.d                                | 0
 test/unittest/scripting/tst.assign.d                              | 0
 test/unittest/scripting/tst.basic.d                               | 0
 test/unittest/scripting/tst.pgid.d                                | 0
 test/unittest/scripting/tst.pid.d                                 | 0
 test/unittest/scripting/tst.sid.d                                 | 0
 test/unittest/scripting/tst.trace.d                               | 0
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d | 0
 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d     | 0
 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d   | 0
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d | 0
 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d     | 0
 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d     | 0
 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d      | 0
 29 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 test/demo/script/interp.d
 mode change 100644 => 100755 test/demo/script/tracewrite.d
 mode change 100644 => 100755 test/demo/spec/specopen.d
 mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
 mode change 100644 => 100755 test/unittest/funcs/substr/tst.substr.r
 mode change 100644 => 100755 test/unittest/funcs/tst.basename.r
 mode change 100644 => 100755 test/unittest/funcs/tst.index.r
 mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
 mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
 mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
 mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d

diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
old mode 100644
new mode 100755
diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
old mode 100644
new mode 100755
diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
old mode 100644
new mode 100755
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
old mode 100644
new mode 100755
diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
old mode 100644
new mode 100755
diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
old mode 100644
new mode 100755
diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
old mode 100644
new mode 100755
diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
old mode 100755
new mode 100644
diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
old mode 100644
new mode 100755
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
old mode 100644
new mode 100755
-- 
2.51.0

