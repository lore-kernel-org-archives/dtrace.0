Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AB2ED17B
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771527232; cv=fail; b=PA8VG3VdoISxsb3svG0UJEa82zs31nr99mKWf959t2pm3v3IvkuFaJGxWq2xNDoKIQBfsTyiX/5ipohlvr0btt/ApvGPiHWM9K5EFVciPtoDK6jm10GZ+Bm4/ev1MF9ykWj+HTUwdcDCzNGIkiXwM0twOuDQzrJTojMPKy3mjsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771527232; c=relaxed/simple;
	bh=p9CwkYEP7RJc2BcJaYwLKHFH1Zq9mqN3BNZSYHmEy5c=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=tBnub7hYDTFHviCLNwdFK6btFciNA/xl8GOJgxPSFW0wbbp73bRf4ySBbBFOY5Irj4dyvdZJ1/CeVyXV5yCXtFSIAYuuwmeRUPoxEOYiAoRFJyHIdMZQdyxr36XmitWZ1yNajw2NPkBGvKwh3uCFprorOGMhhCKzIm1voVBzWNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h0Z22oEt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=auRFzNEr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h0Z22oEt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="auRFzNEr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JH11rZ495332
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NhIj6/7pi3C0AZ9pdkSEvbAcifefIfv7Nhz5Bgk167U=; b=
	h0Z22oEt1qzkdWiOCWmkwjrvOSYs8kbdY+VZ425ONxcLPn69BeuFEBF1JKX7aF+g
	ngvHpeoTjY2mtH4vOfOpy5imxO3ixw5lCdgYlQ3YOYEpxa6VxOhtW/JRhkqnP3eN
	yT8OGvPVDcLVWaLGP2OwGZOKtcowPGymaEmxadyk4GPhnLxe2Y2nlxTJHwP7ZGqr
	l3lbYXAfnVD/kITzpbtpc/t3B3cUOlJevAKrHxZHgydsEprxD8GqjgaW8tVhyBYS
	iqMZ8b8oFczDoaNFKsO3ZhOUEdDfAFnc1ThIsqOuzLrytI0ViDl2M1W2u4HAi4J3
	ptax/nWmPShQj8Dabf0mJg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj6mfxse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:53:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JIFSUv022859
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:53:47 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2fakgr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhpzcoAQfEKsvMlUO6a/G4IdQrTOCspbgDNYC44RBANnAK/62vNp9M4rKv+TtRqTOHop4Xe0vCrsKjxcWUHQKRlfiSfTXAQjDggl/TdfdzW8MMogI6HRftTkdIhN9z3m5z/lBl/mc2aKvi0tymt4QVow1CFCKTfDwLctY8rot3/JITxsZgZeDr1NTt/0YFIRgVh7h9U9UIY+9DcM6kpj4LAg2cFt9iZmhZJ03yTqWLmEnXW6SKuBgE/VdRA7m82I/9ne+BnpQb9Ivhok6a9Z3Icn7Ul6FFCwVzlSl2zEK5QXBpX/I41FLDamgk2g1Z4ObZdsoXDyy+PaLpNrzmfUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhIj6/7pi3C0AZ9pdkSEvbAcifefIfv7Nhz5Bgk167U=;
 b=tQeXd8E9FGPuz+wtID3cApJPPKJ9LKMpAhG90yPU0C+zPbeE8YpYnpD2jEPq+3lxGGKr0ur0E2Gx9x8+HaCWFjciMb4AI8tW8SuOt1G5RtZ4aBL1d2lSg0RNf8FEn9aL2Q/BbJLzg3tJUUyGIqli7iPQ2W1iiSKLi1oau72sLw6b+2Ejn2ynhbNbe6i8CXcpD5iGcRM9v8smTEtzt8wjjKBCQUgESK9OKi2f3xkuE6bPSCZg1JnuAKQlK+4oPlxUoVSV9N/7lDOaw8jBAVMOxHN7lCTXm3uy22nYPYoQr4kEkW74P/dJLFxYk4XVc+JFXIclmbJxkJ+3KcCeBeZi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhIj6/7pi3C0AZ9pdkSEvbAcifefIfv7Nhz5Bgk167U=;
 b=auRFzNErRsDW+scW0R3CoAQdnJjCLWBVUOc7Q37qMo/sq70cJzjkUTkI8mBtePc4B+9Obc1pUCT54zzY8Uq7Gn2/lPkx3TGLtVsFurCP4OsLg8Zw0qvTdEdv1gtXVZG5o8pzTGi4mOmb2z9PXv9w6+yPeHhmaY9J02i5ztiYoYI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB4494.namprd10.prod.outlook.com (2603:10b6:a03:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 18:53:43 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:53:43 +0000
Date: Thu, 19 Feb 2026 13:53:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5] Add packaging configuration for Debian
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75224B8E0902B87ECF8AAEEFC26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb04263-5f78-4671-689a-08de6fe833e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?399CqGco58H4Th6PA1XG+RdId9nLtuyBaqI65fEMU+D/c0rGc9RLg1qJCe8O?=
 =?us-ascii?Q?KocAk/U4zWydpes2Ci59DzplNAUU/4C2noGPfXRRRRPo1oYr1mCfCrMQNctl?=
 =?us-ascii?Q?LBU3Fgil490soJGiegQ16I3ePKidBg3Z0nUGV6mw/Upu7SZI4eMYUSVfF2ac?=
 =?us-ascii?Q?P1kst0SvVLqfLUEq2C/nhl7+n8aJ+xEgchOYDT0OXke0sus++/0/GKFv8XZq?=
 =?us-ascii?Q?AbljB7XEDnik4eGo3zFh8jVtkL6yYe6Gu5yRZzvsI3dSGFHibPdTrPTNpubP?=
 =?us-ascii?Q?HQrk+vvLmTgsWQhFXQhcrTmryT9OuuqncSIMMUJyeRkEbuAjfPtd9YjbaUTD?=
 =?us-ascii?Q?7ORWwg9zOQp2XDna2araoiBPJfozQphGpL+fJrmZwZDC/FWMYjTwlVy0hFTZ?=
 =?us-ascii?Q?1bn82qV5prWe2CI7JVifXCUi3u4B5TlIA98k+HHgyb8PraIOcdh11qMYDVt3?=
 =?us-ascii?Q?uiPjtdZsHcoeXr9pwtgmpYTzvjR/gr6p+6sd4AJ9PM5t7DrD7+OO/hLV4g5E?=
 =?us-ascii?Q?1958xQWBjZ8eJu5Nz/q3CL0q1mD+GePXCBcwAipRS8ELhVf4qaOJcxPelfI/?=
 =?us-ascii?Q?zFCNN6XG0bQt4FoFt2jxwI7TbeVc6uELNXngCcBOvXZ4RT2tnHVftmRc++SZ?=
 =?us-ascii?Q?ZBnrmv76dg+J5sjbOJV75KLJNMc1AAUT0x0/xP/BIyUPU3qdM1ScCzNOk1LC?=
 =?us-ascii?Q?P2HcGNcd/0+O9fe9cDWxUKcXavEK3G/d9kP5SZqS+4RpUZhZ627pO6Z4lirr?=
 =?us-ascii?Q?SRtVFhnaJhc/LZgUmZ9y3pJizd+elQli7NM/eiDeNaGeMnzb8rXx2FJgbtcg?=
 =?us-ascii?Q?FlMjaqR3YaCfGfz4A39q5A0TpTHl9MvlTGJqwWvsoUww0UXIporydUej/cNb?=
 =?us-ascii?Q?CjlDTCZk1z7yotxr5d5nLHAANWlSofzduRjIJvCvF43Bev6guiRKVIpQVxnI?=
 =?us-ascii?Q?GQVL33LWlOgvP8DPdnExBPhTZmhBfCqelgVqsD1QOjXT/hUCIA6nYiHanIXp?=
 =?us-ascii?Q?OQeTDezgqDI8iKyeuYRq2Y5RrgtoSSPxrI16YgGRkg06BVJpLoi6XTaxuuIf?=
 =?us-ascii?Q?zprVZNIweTLZ1PimLkPNHreV3fG7Lk/OXVK8LEdflhnAM9JIfUVgCsjWAKR8?=
 =?us-ascii?Q?xzTcLogNztKFKZo9rENdEK7oaU4TQQy9+YkxdnT9j1ow0kVX5a7SN8f/z0oJ?=
 =?us-ascii?Q?WKhyEII4It6ZakxeaGSVmd6gW6DcWCppUMB12VUh4flNt9Uw/QopBEpeft/8?=
 =?us-ascii?Q?1ulTbYSHfBDKwdEKmngBQNhJ12YElCk+Jstx4Vz9KmIPLmbzqydGvGtpAkO2?=
 =?us-ascii?Q?cY8OokWdKAHjmbvhBkdiOVFguG/jMki2bopd4BuvUfkSRtLE/1ZX7lOO0Ub8?=
 =?us-ascii?Q?awujFgKHpv7FANctFOR5ZODcww9v67G9iiThq1NzzZJoEQkc9LOOK2Mpu8Ul?=
 =?us-ascii?Q?VM5ln82tdvjyiEV4ffPvS93IZYdaQWh+2K6XEiLWf3/LCHluFLH4hdEPRPmm?=
 =?us-ascii?Q?z+91sHBc3e/+W/M2sUc5vl65tDKUQCpGFtcf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jDfLQwmh4m+ohYLgCfAbRQ/EaIka/XPY6SCXQmaZtGVszNRbmMubaPKfKKfP?=
 =?us-ascii?Q?DDr7PAKku4HaLR+L5tAuE1I/wN2OPiPX0WBFchntbzd/PPzFPDLAOknflo/z?=
 =?us-ascii?Q?ai7wffiukgsrAGkBwQ3NneA0GbtEe/+MopUcCZo/XxXrb0v6dpaVtmLkUTGP?=
 =?us-ascii?Q?0Cktl9zpo5I1QfxW6B2flGg3ZHlk9b0O9yZLxM1AqxK5vP0Bj6JC5TYITuZz?=
 =?us-ascii?Q?3C/6mwAjxnmJInEeRrq0u6GZl98amUjvA1ntF8zqh8dsst9eCZ0ZHxH3Ctnw?=
 =?us-ascii?Q?MmS1Ug+OwfSi7pTXtJb8WYqN9KcloJ0/V6C9NLCOk9yuuf3wBYpHUa7+4coC?=
 =?us-ascii?Q?vPdxjvnCYJ73pxK+nh2YHgNGJ1lBO7A+ueidPNblDCttDS7aCV3men/CajpT?=
 =?us-ascii?Q?JNsw1zKr6nvSvtMg5JrfmgM9E+SHbxHug/NKlayGJl5tLFCxYiOfcSRiYGlX?=
 =?us-ascii?Q?C8/Z8EipXiIroeII3QPU/rTPt28lyODaEdNZPkmbJS0wIr3LR4a7RgZeH0Gz?=
 =?us-ascii?Q?ozHl/mwsyr+7hqQ9vBu0icmLsok1i6mdFvz8VDv99TUYewCYBUA1UAzdRsWF?=
 =?us-ascii?Q?7/qQp/aA1c4qfwRTLbrThHG60OQRe4u7dIY/2CJ/Em++RSvZvW2s7nSvyIoU?=
 =?us-ascii?Q?UUSwhsqJ5ns1zzPUyMe5HX4EYDAiqGwCX7rrwcjWHpNJQSoRdC8XRCfgVFGq?=
 =?us-ascii?Q?6Na/HwsnTMVHyURs1F7HEqfnKwxiWHsQr4WuyVlTYQrelmzHAnk371qXIGjF?=
 =?us-ascii?Q?sigfqNis7VigGmDe10PvehK00Uxy6uhxyVsxx4wy3duPNv4c0NiopaKXcys7?=
 =?us-ascii?Q?4Yl8FHmKquAhnrJQSRGiCPH9WYcxbH8H0y1aKsDtG93G6Nn7fo8wqtu82aI/?=
 =?us-ascii?Q?Q1NUN0IVLAwy75xgGDGqZrh+X8WRuv7/VGkf5AN2iAPgs7sHrHwj8VlVba80?=
 =?us-ascii?Q?69+pvw90jefRqRaDAj1eM46uYvvUfYZk268U9LfIGuZKbxEa5rdoH7GL6AGu?=
 =?us-ascii?Q?NttCTn71jXRILnfmil8RbxWbJMX7a8GitjaU3yREuhhqE5BtV9fpEa/pihQ2?=
 =?us-ascii?Q?SQy09LJx4CDi3srQDMXjh+qJdq9WheEjvJ4qw77DCLB/IWnNZEojSzS6wpKK?=
 =?us-ascii?Q?7JhdbfcI5uHWuWjbAuPdAzN9Iy3dUBiNvc3zufBlofZfnlj9AliqR9CysEV9?=
 =?us-ascii?Q?Wxnr2H8K3mugE75u2ho9ZGTF6EqBmHESXxDXxPBYplKksdebjI+NCWIPSp06?=
 =?us-ascii?Q?jLFmrqFJ2kdVPevCExkcGYv4yjDdOXIbB5BeNIM4dWNcGpzL/IY1phefnlzE?=
 =?us-ascii?Q?kSq6JByXoyoHCq6V5yg+5iqbB2tVaXAlAD9AwzazDjCpDOYT7N1TE6yzkX+i?=
 =?us-ascii?Q?Szi+EYrJsUgL7q6GQz8/VuOpc/gdjqr9DEnsp/V48Id2IC7PpRvTkeOLpTcs?=
 =?us-ascii?Q?5jk+xe97LBbzsmteaVwN8mbClB2lTFIsXSLY+XzQ+BZAJLqtRbDwSExDx0so?=
 =?us-ascii?Q?hAKeL5UX4feCrj7gTgruFC9TLziiHU9duOiXxZA3sI65Q442Wnp4OVhEE5oe?=
 =?us-ascii?Q?Q5Y4RYElEhVkC5C1Jp7U7wszZA7jey/h6hwzwJVSFnhoMMNytyFCaw5/je4e?=
 =?us-ascii?Q?eLKNexmAkv7HR1RqjFwyj4sj0JI10WI1kkf3ZQXmIe3i8IYpi62qt3h3wq1r?=
 =?us-ascii?Q?Wvr2GPgQkZbpt4S/cnljJfMfgeqLq0RHL6gp875GfliIbsPRtwsCRIxvWxYS?=
 =?us-ascii?Q?R+l7uxzyvA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JJMp26UtciBKiO3FF38FMHTjgY7JGecGQJnZeMzYSxPJqpf3ZwIbfJnq/BuJ3HTjZLFuNPAfY6LsuBE2ydjQkG+wXsqGLQogy0mkU8XIWF9R37zzK7D6V2JYN0RzR0egxs1N9mHnVVi8MC6a0skyfDHsEToEtzoGxqDHHnEIimeMcBnZtFZuRSFNgx1ZozR2VMCLdMJbPZPzbBBoXp5tEHTUMCD2l3v+6/MwWhbBz5KYSXHG1Q8FViG+o68XgeDffpY7v8ciXmj9C/WDQuoJLZzKScxBsSEbiqJaxJyTVS6SbtsIoywc3Qr4pa2IxXHdl2S+y9tyqwClz25yMPfr+7gS5yuR1vWrmQZE9HxdMjnFOpe7RIGRa+19GsodhobS5bKpcKsxQRTyiMEXvflSsBV3Hy5iahZnpIoqS9tPs2CljaSZ5CSK+t0Pf+AytUkcBmSX3lTkhpyNOHpEWnpL/aEJ6ULA+lXCdYRF2ZUPKA/1NCP36lWMAYgC/JGGcYpYEBXwX1+fgpOwP7JMbyIwCXklMx/A1Q14azl8QrdbZSxtOwccwvpASoqFfuqn2g4b72geXChE3OIhZzpoPpDi2myLOJ/5BlgNbrwPonrvhbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb04263-5f78-4671-689a-08de6fe833e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:53:42.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVTQhMYyTyJ6o8TjwDJ158flJp6rVRWcptpmDEjVGbVZz9B9WMOifkT2DZewffAIhzKeOGnJVqlgRWw11Dlg1s6sLGN8JuGBx3uPUZjPbEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4494
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190171
X-Proofpoint-GUID: IJFuU_j7EBS63bR8m3HKRSQeaD2yPbx-
X-Proofpoint-ORIG-GUID: IJFuU_j7EBS63bR8m3HKRSQeaD2yPbx-
X-Authority-Analysis: v=2.4 cv=JO82csKb c=1 sm=1 tr=0 ts=69975c3c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Ixkok3qfAAAA:8 a=mDV3o1hIAAAA:8 a=I5J9bQijOuhHCpxPiRcA:9 a=3ZKOabzyN94A:10
 a=_4Lj5ymMnAn2NA9aJKr1:22 cc=ntf awl=host:12264
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3MSBTYWx0ZWRfX8ZNNFynx/b2p
 wsjthqmdAVTOhJioAlWGp9Q60xuCGNgwf93E/+J6mhAGTnDHoWBXDJ0kK45y5N8SGN+b2pRBV3/
 G+qCIRBBGbkAFk637IVLs+rWL+SrWRA8BtGt+vUpsNNWA4sDQ3EDinG9R2MUv4dpw0qkpXhpKjF
 nEu0Azme2sgBcrZ01y0JvIA3hzn8eKVapz7HZgzvypDXnpFO9X9nPMvpWNf6sMBsHUMT9FYud9s
 jOUzOaGJIOKSGezKDYQ5yWvnLHIxAd1ZgH2AonjsV5GgFn8VjHl1LeKXB47DnRMYwzawFI8FI6S
 5nCsxgUmbY8zMaq3VW/FQhA0jieMqmp6RPpGhz1S8dx20V7Y65eDr0Msco5oRNpMzEfWwk0b5uH
 DlJu4DSbd/dL75ya9WRhF6REv4T54YusgtZ+6iyiDEo8MpFRHuyBazQvLmJ8YaxR8VP/mgksRhe
 OYof1MEZVPvVJWXxikPDnas2RyqOJljEj7lOIUrc=

Packaging configuration files for Debian are provided in dists/debian.

Sample steps to build DEB packages:

 - make dist
 - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
 - cd $D
 - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
 - cd dtrace-x.y.z
 - make prep-debian
 - debuild

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dists/Build                                   |  16 ++
 dists/debian/control                          |  74 ++++++++
 dists/debian/copyright                        | 103 +++++++++++
 dists/debian/dtrace-tests.install             |   1 +
 dists/debian/dtrace-tests.lintian-overrides   |   8 +
 dists/debian/dtrace.docs                      |   1 +
 dists/debian/dtrace.install                   |   1 +
 dists/debian/dtrace.lintian-overrides         |   1 +
 dists/debian/dtrace.manpages                  |   1 +
 dists/debian/libdtrace2-dev.install           |   5 +
 dists/debian/libdtrace2.install               |  12 ++
 dists/debian/libdtrace2.lintian-overrides     |   4 +
 dists/debian/libdtrace2.manpages              |   1 +
 dists/debian/mkChangelog                      | 174 ++++++++++++++++++
 dists/debian/patches/debian-configure.patch   |  17 ++
 .../patches/debian-interpreter-paths.patch    | 107 +++++++++++
 dists/debian/patches/series                   |   3 +
 dists/debian/rules                            |  24 +++
 dists/debian/source/format                    |   1 +
 19 files changed, 554 insertions(+)
 create mode 100644 dists/Build
 create mode 100644 dists/debian/control
 create mode 100644 dists/debian/copyright
 create mode 100644 dists/debian/dtrace-tests.install
 create mode 100644 dists/debian/dtrace-tests.lintian-overrides
 create mode 100644 dists/debian/dtrace.docs
 create mode 100644 dists/debian/dtrace.install
 create mode 100644 dists/debian/dtrace.lintian-overrides
 create mode 100644 dists/debian/dtrace.manpages
 create mode 100644 dists/debian/libdtrace2-dev.install
 create mode 100644 dists/debian/libdtrace2.install
 create mode 100644 dists/debian/libdtrace2.lintian-overrides
 create mode 100644 dists/debian/libdtrace2.manpages
 create mode 100755 dists/debian/mkChangelog
 create mode 100644 dists/debian/patches/debian-configure.patch
 create mode 100644 dists/debian/patches/debian-interpreter-paths.patch
 create mode 100644 dists/debian/patches/series
 create mode 100755 dists/debian/rules
 create mode 100644 dists/debian/source/format

diff --git a/dists/Build b/dists/Build
new file mode 100644
index 00000000..c75f9332
--- /dev/null
+++ b/dists/Build
@@ -0,0 +1,16 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dists_DIR := $(current-dir)
+
+# Prepare package building on Debian (copy ./dists/debian in ./debian, and
+# generate the debian/changelog file.
+
+prep-debian::
+	$(call describe-target,DIST-PREP,Debian)
+	rm -rf debian
+	cp -rp $(dists_DIR)/debian .
+	debian/mkChangelog debian/control dtrace.spec > debian/changelog
diff --git a/dists/debian/control b/dists/debian/control
new file mode 100644
index 00000000..66620d11
--- /dev/null
+++ b/dists/debian/control
@@ -0,0 +1,74 @@
+Source: dtrace
+Section: utils
+Priority: optional
+Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
+Build-Depends: debhelper-compat (= 13),
+ bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
+ libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
+ libpfm4-dev, libsystemd-dev, libz-dev
+Standards-Version: 4.5.1
+Homepage: https://github.com/oracle/dtrace-utils/
+Rules-Requires-Root: no
+
+Package: dtrace
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}
+Description: Dynamic tracing for Linux (DTrace)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+
+Package: libdtrace2
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends},
+ fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
+Description: Dynamic tracing for Linux (DTrace) (library)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the shared library.
+
+Package: libdtrace2-dev
+Architecture: any
+Depends: ${misc:Depends},
+ libdtrace2 (= ${binary:Version})
+Description: Dynamic tracing for Linux (DTrace) (development)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the development files necessary to develop
+ alternative implementations of the user interface for libdtrace, i.e.
+ replacements for dtrace(1) itself.
+
+Package: dtrace-tests
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
+ binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
+Description: Dynamic tracing for Linux (DTrace) (testsuite)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the testsuite.
diff --git a/dists/debian/copyright b/dists/debian/copyright
new file mode 100644
index 00000000..475f9bac
--- /dev/null
+++ b/dists/debian/copyright
@@ -0,0 +1,103 @@
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Upstream-Name: dtrace
+Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
+Source: https://github.com/oracle/dtrace-utils/
+
+Files: *
+Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: include/linux/bpf.h
+Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/linux/btf.h
+Copyright: Copyright (c) 2018 Facebook
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/sys/auxv.h include/sys/bitmap.h
+Copyright: Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T
+License: UPL-1.0
+
+Files: include/sys/glibc_internal_link.h
+Copyright: Copyright disclaimed (all content required for interoperability)
+License: LGPL-2.1+
+
+Files: libproc/libproc.h libproc/Pcontrol.c
+Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+License: UPL-1.0
+ The Universal Permissive License (UPL), Version 1.0
+ .
+ Subject to the condition set forth below, permission is hereby granted
+ to any person obtaining a copy of this software, associated
+ documentation and/or data (collectively the "Software"), free of charge
+ and under any and all copyright rights in the Software, and any and all
+ patent rights owned or freely licensable by each licensor hereunder
+ covering either (i) the unmodified Software as contributed to or
+ provided by such licensor, or (ii) the Larger Works (as defined below),
+ to deal in both
+ .
+ (a) the Software, and
+ (b) any piece of software and/or hardware listed in the lrgrwrks.txt
+ file if one is included with the Software (each a “Larger Work” to which
+ the Software is contributed by such licensors),
+ .
+ without restriction, including without limitation the rights to copy,
+ create derivative works of, display, perform, and distribute the
+ Software and make, use, sell, offer for sale, import, export, have made,
+ and have sold the Software and the Larger Work(s), and to sublicense the
+ foregoing rights on either these or other terms.
+ .
+ This license is subject to the following condition:
+ The above copyright notice and either this complete permission notice or
+ at a minimum a reference to the UPL must be included in all copies or
+ substantial portions of the Software.
+ .
+ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ Licensed under the Universal Permissive License v 1.0 as shown at
+ http://oss.oracle.com/licenses/upl.
+
+License: GPL-2 with Linux-syscall-note exception
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License version 2 as published by the Free Software Foundation.
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
+ .
+ NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+ .
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+License: LGPL-2.1+
+ This file is part of the GNU C Library.
+ .
+ The GNU C Library is free software; you can redistribute it and/or
+ modify it under the terms of the GNU Lesser General Public
+ License as published by the Free Software Foundation; either
+ version 2.1 of the License, or (at your option) any later version.
+ .
+ The GNU C Library is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ Lesser General Public License for more details.
+ .
+ You should have received a copy of the GNU Lesser General Public
+ License along with the GNU C Library; if not, see
+ <https://www.gnu.org/licenses/>.
diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
new file mode 100644
index 00000000..a04ebfb9
--- /dev/null
+++ b/dists/debian/dtrace-tests.install
@@ -0,0 +1 @@
+usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
new file mode 100644
index 00000000..22cbd6eb
--- /dev/null
+++ b/dists/debian/dtrace-tests.lintian-overrides
@@ -0,0 +1,8 @@
+dtrace-tests binary: unstripped-binary-or-object [*]
+dtrace-tests binary: unusual-interpreter dtrace [*.d]
+dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
+dtrace-tests binary: executable-not-elf-or-script [*.d]
+dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
+dtrace-tests binary: statically-linked-binary [*]
+dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
+dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
new file mode 100644
index 00000000..7696583d
--- /dev/null
+++ b/dists/debian/dtrace.docs
@@ -0,0 +1 @@
+usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
new file mode 100644
index 00000000..6be68ccb
--- /dev/null
+++ b/dists/debian/dtrace.install
@@ -0,0 +1 @@
+usr/sbin/dtrace
diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
new file mode 100644
index 00000000..11005f4a
--- /dev/null
+++ b/dists/debian/dtrace.lintian-overrides
@@ -0,0 +1 @@
+dtrace binary: unstripped-binary-or-object [*]
diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
new file mode 100644
index 00000000..e54b52b3
--- /dev/null
+++ b/dists/debian/dtrace.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtrace.8
diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
new file mode 100644
index 00000000..b5e66db5
--- /dev/null
+++ b/dists/debian/libdtrace2-dev.install
@@ -0,0 +1,5 @@
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
+usr/include/dtrace
+usr/include/dtrace.h
+usr/include/sys/dtrace.h
+usr/include/sys/dtrace_types.h
diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
new file mode 100644
index 00000000..36294de3
--- /dev/null
+++ b/dists/debian/libdtrace2.install
@@ -0,0 +1,12 @@
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
+usr/lib/systemd/system/dtprobed.service
+usr/lib/systemd/system/dtrace-usdt.target
+usr/lib/systemd/system-preset/50-dtprobed.preset
+usr/lib/udev/rules.d/60-dtprobed.rules
+usr/sbin/dtprobed
diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
new file mode 100644
index 00000000..34b4011d
--- /dev/null
+++ b/dists/debian/libdtrace2.lintian-overrides
@@ -0,0 +1,4 @@
+libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
+libdtrace2 binary: unstripped-binary-or-object [*]
+libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
+libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
new file mode 100644
index 00000000..fef53dc3
--- /dev/null
+++ b/dists/debian/libdtrace2.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtprobed.8
diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
new file mode 100755
index 00000000..69958dca
--- /dev/null
+++ b/dists/debian/mkChangelog
@@ -0,0 +1,174 @@
+#!/usr/bin/awk -f
+
+#
+# This script can be used to convert the dtrace.spec into a Debian changelog
+# file.  It is intended to be invoked from the 'prep-debian' make target, but
+# it can be used manually as well:
+#	mkChangelog debian/control dtrace.spec > debian/changelog
+#
+
+function error(msg) {
+	print "E:"msg >"/dev/stderr";
+	err = 1;
+	exit(1);
+}
+
+BEGIN {
+	if (!dist)
+		dist = "UNRELEASED";
+	else if (dist != "unstable" && dist != "experimental")
+		error("Bad dist ("dist")");
+}
+
+/^Maintainer:/ {
+	sub(/^Maintainer: +/, "");
+	m_name = $0;
+	i = index(m_name, " <");
+	m_mail = substr(m_name, i + 1);
+	m_name = substr(m_name, 1, i - 1);
+
+	nextfile;
+}
+
+/^Name:/ {
+	pkg = $2;
+	next;
+}
+
+/^%changelog/ {
+	in_changelog = 1;
+	next;
+}
+
+!in_changelog {
+	next;
+}
+
+function lineWrap(p, s, line, len, l, n, m, i) {
+	n = length(p);
+	line = p;
+	len = n;
+
+	m = split(s, arr, / +/);
+	for (i = 1; i <= m; i++) {
+		l = length(arr[i]);
+		if (len + 1 + l >= 80) {
+			print line;
+			line = sprintf("%*s %s", n, "", arr[i]);
+			len = n + 1 + l;
+		} else {
+			line = line " " arr[i];
+			len += 1 + l;
+		}
+	}
+	delete arr;
+
+	print line;
+}
+
+function emitEntry(i, j, n) {
+	# Loop through the contributions, determining who each contribution
+	# should be credited to.  If there are multiple contributors, we pick
+	# the first one who is not the commit author (if any).
+	# If all contributions are from the commit author, we do not emit an
+	# explicit credit line.
+	for (i = 1; i <= lc; i++) {
+		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
+		sub(/[ \t]+$/, "", lv[i]);
+		gsub(/  +/, " ", lv[i]);
+
+		cont = name;
+		if (match(lv[i], /\([^)]+\)$/) > 0) {
+			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
+			lv[i] = substr(lv[i], 1, RSTART - 1);
+			sub(/[ \t]+$/, "", lv[i]);
+			n = split(auth, arr, /, */);
+
+			# Find the first contributor not the commit author.
+			for (j = 1; j <= n; j++) {
+				if (arr[j] == name)
+					continue;
+				cont = arr[j];
+				break;
+			}
+			delete arr;
+		}
+
+		# Add to the list of contributions for this contributor.
+		if (cont in map)
+			map[cont] = map[cont] " " i;
+		else
+			map[cont] = i;
+	}
+
+	print pkg" ("vers") "dist"; urgency=medium";
+
+	# First emit contributions by people other than the commit author.
+	n = 0;
+	for (cont in map) {
+		if (cont == name)
+			continue;
+
+		n++;
+		print "\n  [ "cont" ]";
+		$0 = map[cont];
+		for (i = 1; i <= NF; i++)
+			lineWrap("  *", lv[int($i)]);
+	}
+	if (n > 0)
+		print "\n  [ "name" ]";
+	else
+		print "";
+
+	$0 = map[name];
+	for (i = 1; i <= NF; i++)
+		lineWrap("  *", lv[int($i)]);
+
+	delete map;
+
+	if (m_name) {
+		name = m_name;
+		mail = m_mail;
+		m_name = m_mail = 0;
+	}
+	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
+}
+
+/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
+	date = $2", "$4" "$3" "$5;
+	i = index($0, " - ");
+	vers = substr($0, i + 3);
+	name = substr($0, 19, i - 19);
+	i = index(name, " <");
+	mail = substr(name, i + 1);
+	name = substr(name, 1, i - 1);
+	if (name == "")
+		error("No name in: "$0);
+
+	lc = 0;
+	delete lv;
+
+	next;
+}
+
+/^- / {
+	sub(/^- +/, "");
+	lv[++lc] = $0;
+	next;
+}
+
+NF == 0 {
+	emitEntry();
+	date = "";
+	next;
+}
+
+{
+	lv[lc] = lv[lc] $0;
+	next;
+}
+
+END {
+	if (date && !err)
+		emitEntry();
+}
diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
new file mode 100644
index 00000000..d4a89bb9
--- /dev/null
+++ b/dists/debian/patches/debian-configure.patch
@@ -0,0 +1,17 @@
+Description: issue a warning for unknown configure options
+ The Debian build system specifies configure options that are not known to
+ the DTrace configure script.  They should not cause the configure script
+ to abort.
+
+--- dtrace-2.0.4.orig/configure
++++ dtrace-2.0.4/configure
+@@ -172,8 +172,7 @@ for option in "$@"; do
+         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
+         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
+         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
+-        *) echo "Unknown option $option" >&2
+-           exit 1;;
++        *) echo "Unknown option $option" >&2;;
+     esac
+ done
+ 
diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
new file mode 100644
index 00000000..58bea538
--- /dev/null
+++ b/dists/debian/patches/debian-interpreter-paths.patch
@@ -0,0 +1,107 @@
+Description: fix interpreter paths in tests
+ Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
+
+--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ [ `uname -m` = "aarch64" ] && exit 0
+ exit 2
+--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ [ `uname -m` = "x86_64" ] && exit 0
+ exit 2
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_0.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_0.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_1.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_1.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i0.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i0.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i1.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i1.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-assoc.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-assoc.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-gvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-gvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-lvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-lvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-tvar.r.p
++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-tvar.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ 
+ # runtest.sh looks for "0x" to filter out pointer values.
+ # Strip the 0x so that the illegal address will not be filtered out;
+--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.ifdefincomp.r.p
++++ dtrace-2.0.4/test/unittest/preprocessor/err.ifdefincomp.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+ # supported, we have to sed it back again.
+ s,[‘’],",g
+--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.incompelse.r.p
++++ dtrace-2.0.4/test/unittest/preprocessor/err.incompelse.r.p
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sed -f
++#!/bin/sed -f
+ # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
+ # supported, we have to sed it back again.
+ s,[‘’],,g
+--- dtrace-2.0.4.orig/test/utils/clean_probes.sh
++++ dtrace-2.0.4/test/utils/clean_probes.sh
+@@ -1,4 +1,4 @@
+-#!/usr/bin/bash
++#!/bin/bash
+ 
+ TRACEFS=/sys/kernel/debug/tracing
+ EVENTS=${TRACEFS}/available_events
diff --git a/dists/debian/patches/series b/dists/debian/patches/series
new file mode 100644
index 00000000..6d3b5413
--- /dev/null
+++ b/dists/debian/patches/series
@@ -0,0 +1,3 @@
+# You must remove unused comment lines for the released package.
+debian-configure.patch
+debian-interpreter-paths.patch
diff --git a/dists/debian/rules b/dists/debian/rules
new file mode 100755
index 00000000..8646ac1a
--- /dev/null
+++ b/dists/debian/rules
@@ -0,0 +1,24 @@
+#!/usr/bin/make -f
+# You must remove unused comment lines for the released package.
+export DH_VERBOSE = 1
+export DEB_BUILD_MAINT_OPTIONS = hardening=+all
+export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
+export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
+
+include /usr/share/dpkg/pkg-info.mk
+
+export DEB_VERSION_UPSTREAM
+
+%:
+	dh $@
+
+override_dh_auto_configure:
+	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
+
+override_dh_strip:
+	dh_strip -Xdtrace
+
+override_dh_auto_test:
+
+override_dh_auto_install:
+	dh_auto_install -- install-test
diff --git a/dists/debian/source/format b/dists/debian/source/format
new file mode 100644
index 00000000..163aaf8d
--- /dev/null
+++ b/dists/debian/source/format
@@ -0,0 +1 @@
+3.0 (quilt)
-- 
2.51.0

