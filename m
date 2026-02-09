Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3930AD10
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662051; cv=fail; b=Ro50eau1RKzB+6eueWn5JF+K62CM2O3AVFkSpzs1wvPDKYYCuoBy4B4nsvkHL7zS6IpG8d8CjhZk/0S+lmpVab1aSpxAHWcjltixKG6vt8ddr2eKA38S7InkqdTPms+lPB5HcXfmy8kquU4p3DO1lpRF4+SeFyQC1Sbg7MAWS8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662051; c=relaxed/simple;
	bh=v+DdjCBRLTLZshKeB2LeCPsSwHz+XAShlwjr+tzvCOA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TevUG04WMyTfYOYDG1V7VhTiY4/UPxqYmR4vu2fZ3mamLCCdOmosjjey4d6oDuV9yRNukjy3X2PfE2ctkI1U9gxLWU1hfpYjGtDrutm8MaYix/W3XzzCueGfGH4+6AqISniCxu2Ppy5xKyuzroNXab1lWpFG58UEWkWaO31j3OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cd3QyCVT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ffuGCQT7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cd3QyCVT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ffuGCQT7"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECWq62924633
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=U8L/kLGTXho2iak41zFmlhUMvsIGNbxQfOesUfnr0a0=; b=
	Cd3QyCVTw5VfmANOp0irOj+Aqc45VWON7RX9DYil23ek71z4cswDjFsiTwLom5Rl
	MDVgkNDYjzi3nfYzKoB+nH/nMz5K2FZl5Q7sl0WomaEx12iDjYHpIysL9trZIqK+
	oGCx5VPEmo9Nv6EOlDFgXaMXCpGZvA6axJrve1fcDHnkq6j7E2pvHcfMuQAHR0lU
	tqd4VXuk9jomp8dsHndjMOBdyQ1yUL41/h9dCtEoI6C4hAfU7Y/qDVn6T/rgvnK7
	WBHGsT1sYKxvkvcz3BWnBEa/MFXEYlh80eax/adQmvbSchS7HpfQXuEB9JGjGc/C
	QNHn1cWze0f7++yCKKIimg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xf3tgth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:34:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619HpwID004775
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:34:08 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c7jnq5unp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz9JbWF6Mz/Ym9SsvPcQxc+9Q0/Z/8vkbsM4WYPRDqm4uL7WNmeFcShyHcTx95/HXZBpDb9X/pyJ8rtLHdfZZBh2l48qX3bzNXgdAoExkk1Z0NxJZIhnkndRdRLHBcyrv47iOAPH3FmFHctnmfKmMPoYhUGACgGNEbFm8RsvHrc7YldjxaIpl4hGIAsVLCFkwvUBaZCy5BSp2Li7lPnYKK7sRmt8F0CeFuby8439Vtu3NSaZOsra9ZXyTPeOZSROjaxvU6HCDET7z1JHNFwH6xUx8+fbLA1HVitTeSuh8msG6J63Q6pEZ2gNFFDar0EFYmJ6ymajiFMebZINH/M2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8L/kLGTXho2iak41zFmlhUMvsIGNbxQfOesUfnr0a0=;
 b=iaBhHz3cfx9wNwFRH/Sk+OjA0ahoJd7zbeHvbhIj9riyCKxM7TuqeVA4AqcVl0YbCbv8UgWkGrEYik5mYXZji/Aoku2B/0PNOKCsJKgJU2tIjIcO+gcIxMrKWBPSjSm/38g4BuP2HcpSE174weCEEp9dTb1f01lMElnWE3teX++D7qjq5+CD9/PJ3NxyM8myr47xKNHse4cAbsPQhlHqezVwxLEXy+2kcrgFtOUIjMlIdporg7kQAn48ZDDgsEwc+n0zR+QEwGAMVLsNySU7Stv4EgPCgcKtG6PEu2pfgT6xTIBbwfpO7FWWtW0r1uEwZa2BikLNvhYdLKIH7OjUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8L/kLGTXho2iak41zFmlhUMvsIGNbxQfOesUfnr0a0=;
 b=ffuGCQT7lkNM3ZTez6rQ2ZN0qrAmAuJA7AS5MiZLiVDFC0fRfcC8RMpKAPeKyLjf1Ezn1jyfrvw7GyiwT/Snld+A6jmFU1ASxi9xWLYB2H9+0too62T4WnENQkU1t3V7TPGCLk+S5eIINtbQu2m/w3xFlevZULd6zFH0r2QILnk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO1PR10MB4451.namprd10.prod.outlook.com (2603:10b6:303:96::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:34:06 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:34:05 +0000
Date: Mon, 09 Feb 2026 13:34:04 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] syscall: fix syscall probe argument handling
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522898037241A1EC99BBC06C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO1PR10MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdb77eb-5cd1-4afa-3cc1-08de6809cdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X9gq98fzUX9nNth9yV7LY+uoBfIqCTFeSH6IKjPNHpPQfz6FZ+HXNHNs4BMb?=
 =?us-ascii?Q?gqByM4PPDUkWMLuhsl1WyjO5xcxDLMq5iiQQzfB1ZmqF9VLwqf0EGhBaEEfm?=
 =?us-ascii?Q?LNEGe3IBRnawV9cPx7dotQXJaCpuIm8b9Fi1g3WvTpcRI6TpBS0bG/Zwcyad?=
 =?us-ascii?Q?WuET9mk93A5lcd2Vaf0NLMVo1B2aJ7k/4nuiqdtQ/cPu8URbD9LsJIr6nrWK?=
 =?us-ascii?Q?E6H5YamkhDdtdWQ814gnWV6wBtp5GwHX+BEMfNVCa+hrVloIeWRuj/hjN0j/?=
 =?us-ascii?Q?yd/lnSK7FzVH1aszjCq3AGAVMv68FheE12J7V6IWlC+kHhhwXRFnzjaApBa4?=
 =?us-ascii?Q?0WOnv+G2tq8xamuQVCuM1OtWgfQBZOGJvLFl1fwLdrbmwKff5P5Zy0lBEjvC?=
 =?us-ascii?Q?axLmJl/LwSl4ruxVTwy19jC4st+bHVw4YN6JVoB9h3TjCKGiO1TOtg4vzkJb?=
 =?us-ascii?Q?U6l5o2B7Yf/bC7/ec2dluM6pWyFTeYRbRU1IO1KQBtVr3917oWcVKs2UKb7K?=
 =?us-ascii?Q?HTAMv9uYlf5HBKtbc3TwqGFDrxwykSgviv6X6aaSR9TWyRICJ5PXOmPTwe/f?=
 =?us-ascii?Q?aFpoodsBTmeCF8NYKdPmnCVZ1hCfIGVFg3lxQfFGky0U0WJo9drT0I6ZwWY7?=
 =?us-ascii?Q?RzAvdEXVCnNbnAulwadYIkNAHXUJdjIT6fWs1MgCSN6kHUkpHG3ZB6wYZXEm?=
 =?us-ascii?Q?edai+B2o4k9BZcMfthfPfrpi9bfOqQKHYXe4csPF7kl3srnGBg5uWxhGTrnE?=
 =?us-ascii?Q?TIvRw62a4OaJ0RCXxLIWOA6vSs0rvLIy7217RTThqTI5RHVjHqYPotjv568a?=
 =?us-ascii?Q?p5tYzGf13Oh66Ez/YfBKF+/SzL6Kt8Be0VdygvFTTlR6xaLVIV3Zy8MPKpAn?=
 =?us-ascii?Q?29uP++96EA8xvyN7Pm9BoMETRiTH0uCZ1Gb72LdqjcQMrRKfuTvqIwo+leqO?=
 =?us-ascii?Q?BoeZkphfCHfa8IVcuINQ1/AcsS9sqk0q0thobxvAerJJ84SRInwutzR1/eFE?=
 =?us-ascii?Q?aiut/TyZK9gl0ftxeUSOTPMjMRKtPI1HOqiTqpxWOCQ0Lf056lU8X9cQOk1q?=
 =?us-ascii?Q?vm4LDnmvhK31Sz2VNFQSftGxdRgn8EoKuo2aChFI4JIWkOZ3N5oJN4Ax9aVY?=
 =?us-ascii?Q?NbaSLNpSiVaE3Sx53G2lnS2xBfk6epXQvvLaSHrgr7E2MxsTACRnfzWckqK/?=
 =?us-ascii?Q?GEqCbiJ4neYowQ4/SU6X90k1jCC876IkQzA1bn/UIk80l4CClYHD+aZ2J5FP?=
 =?us-ascii?Q?7SyJRVT2sl43Q+xmg9RJyPBS/gNNbCOlXXx5Yt/rf/sw2Iiw2K8KuGSXU+ri?=
 =?us-ascii?Q?q+nVOHg35Kg810CODdzLvUhgIY0Q2Llp1Va2mhJOmwE4rX5rV4rp3fm87Lyw?=
 =?us-ascii?Q?rfDaCO9ouZ/2mdlpZHyr9rWk4JvJOcI9vRoKM9oStzzuc5OYz2EQ7ZV3PP0x?=
 =?us-ascii?Q?x9F8JzTyOIDJGQEQHh2XQSVQVogGLcoaJ2E7E7ugcwASnwZCHko7qXR2Ypx3?=
 =?us-ascii?Q?mp8QT9R6sXJ0cVU/Ci5hdKkQz5n7X/6/R5qgJsJg3uJR/54Pifgedz9CF8pI?=
 =?us-ascii?Q?O93FJJLZJRUdIc2/8wk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+P4mxCdTYdjHyXthY8GISwgoKUwB1sq/i+qjOc2Li+huS8wZkO4cqkozMnB4?=
 =?us-ascii?Q?QX+MuUkB0cl+fB8qOnygPeVNMTNjMv+dbe7I4oxGTC9PqRGIIuKgsplpP3gH?=
 =?us-ascii?Q?NLerRGfS7qlmYpUgTCcNuXI8PBaimotjAd7/4LYgM4dEJZbRjQUXdfr/nOdO?=
 =?us-ascii?Q?spYrcn2SO1QpSfOC6o/2oAWGprQVQo5yM3jFYITtVD7HW9JLu61DBXmS3GaC?=
 =?us-ascii?Q?gXXo5NXF4JJNEz6mT0IvLxcrL5GLWanX1wEwCwy7ZqXUGzzknPzZ22ZPaTAr?=
 =?us-ascii?Q?7NGpxNHvISc7wWAKRy/P4ZSXu571uIXPP5/0xS1H8BcY9s1vi/K6ESXK7UPG?=
 =?us-ascii?Q?lmIFJWW9ozeIRbaWNst4+xbw/eyF5y7xAhDLrbFRA5zqVRlwr+xc0nkeMxj2?=
 =?us-ascii?Q?gXXOIT/ZZ49zpzpH0PebvmCtRuBDPJq26xcf/zubmo24JYN5dI5c6Cq6pFko?=
 =?us-ascii?Q?ljCkpiGg7Vw2yBKjaAae+ld5iDAeMopYDoRm2NEwKPw4kP+XwCxytYKg3lQk?=
 =?us-ascii?Q?CJH0VOsEXw0wYkpqDYVNbHYkr1hzxcgVRXUJFRtaGs+p07gKCCJuC8uh8LIu?=
 =?us-ascii?Q?OECSgBKhbaiUR0xS/eAKDiC9epDUpXoIz3caFGYRkt+Gry5ESOaSTeMYqFhl?=
 =?us-ascii?Q?7/pJ9Zr1okJ2y6OgZiWbC/tivnxZpYo5QDu0lhPMBuZT9++OnDiGMk8/8Xqz?=
 =?us-ascii?Q?Z/DNHxeMdT+fFW5kHjXM2vOzHe90cumsAL+NAn1gPBUHIwvH3oLggwGhtWB/?=
 =?us-ascii?Q?I4wJCuFjsEiXpH/Xqwe/c22Y23MLloJylBTIHDQguUysIBC2/G0YNkuKqmID?=
 =?us-ascii?Q?LQFhh0UpFlPLpO5lhUYC11akpNOvBMZXSlwKNw1SCoePKSD/GiH9UJrz8L4T?=
 =?us-ascii?Q?UfsMeWnMzxTSHinm8dEZrqjQ04D1qeUa9hSmLQdTnVC+WUYmII3Anjnwqdr4?=
 =?us-ascii?Q?Lxne48WcoxG12qIU12g8fdgEtWHHFxgx12LWCYOyZ+XyKw6O7VkrPCRtNHx6?=
 =?us-ascii?Q?V+7WIlSDa4Bc51qAvsCo9KMvF9WriL/P7BsJFU9M+csZKgFNIVSYr5ZAgAD3?=
 =?us-ascii?Q?3lEvUeilmv1HY/0Q4zbWal2PhyaJcEEsrtb7Ch2qP1MVYHGaD/t6hzTTIc5F?=
 =?us-ascii?Q?ZYeHzj6g+5NO+U+VVpfAAR0OpjNAGFMCW3Qr8A441u7CtsskHzeq11z3rphR?=
 =?us-ascii?Q?/KPq7lI1BNQEpOrMJIQLxF4o/LP96J+MEgBizEsmwyTHf8tdIFcxnNxl/Lvi?=
 =?us-ascii?Q?hUGRvQ4feqMfWcA/ZpvtNEFYDq6M7I5ZZcnsXn0iSet5Plh0x2yPaagUtD3J?=
 =?us-ascii?Q?ZV3xIyUJn1HfQUuYi2vP7J9KJc0SVjieLqHLySOmymY9bhBAv1oOVqr2Mci0?=
 =?us-ascii?Q?w7MYexTvHP2yY7FeZiIyqtLTgceY+/Cj0qTN2mVkJD12gO+aqcuNSuWaCA4y?=
 =?us-ascii?Q?/MRjovD99eQeQvm4SXfXICcoXSlzJMuBNxwBaTWFvOuWmsAZJP+xLu+IYfVs?=
 =?us-ascii?Q?TG6hRGuGKZ9CjYqMCR6c2oEFioCLTNx6QieNeUR74LcHlVyHFlXuFXdyAxJr?=
 =?us-ascii?Q?cJQEXi3E3iFB5FROayndqDFhcV/crmoQLIzl72gEOLA2IkrCRl+FXqlVh7zZ?=
 =?us-ascii?Q?HoOUW7aKSBill196SST7m2hvbrONtUwJ9u5LGvqgBIjuymMIYUiUb6+H3dmB?=
 =?us-ascii?Q?BSECPw7L5HSB6hGYV6WlbFvPI4KlJ7y7Eq2vdPu/HTyye4Q08Jmfp/FO2FuP?=
 =?us-ascii?Q?niB+ZtZbFw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aNAMwEfw9HiW2xFM06cpAnAtDK6jz01wgFDgM6luCQwo7mv3bwf1O3C2L3zE/Xyz5nOs8Ulbx0IL999DsZ95rRhfj1ZuKprcAkFEBJA7AVgQE9MH5+Qcr6fhFlR4brQ8faCE8eBiFdJ6gpwasZIKFIL948YylpCE96T+f1Q1hGrBXDx8/QMUKhYcQqqEKMEA4aFR6EPulEVkUWB0ZeLnM6UV3b8whBiKivXmVFqGV77oJQL0v1JxIyxcLi2Sp655VnoStMgcJ9qFzSMe/8n2SBnV3o73LOvAkntsA0bqMUdI1goveE2pSfmW6eI87SlnPyg2mVKPgBEydrvzgu2zP3BjbGVAqcseb6UBzsB+n4G4lT6OkQXcJ0DeZrI4tI4Au7u8LX6y+VqRF11ZzmPCvdfdiYhm9ZnILptCTI8EoR94APMtwM5sg58G08AF/tuaq/tJjw92JdC1rdvJ33uO9DAe7nAErGpvB6PmVDXwCpHjx+VT3DuDCS8NuG6+ya1WkcKG5boUvADPHGEw2f4Mef/RsaspgNZxHtmnx5dWUD28u8PyF4XsR98ArlUjYgP7AscYpNAgcpspLIVNjHlWD0npFUEJKSCPTFdvzSgimJQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdb77eb-5cd1-4afa-3cc1-08de6809cdf1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:34:05.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGTSIl3CRLoh/RC5ml94vye9HqISTXgTvnSfm2hQJM+IFZrsIzo5nNPStG3/pd1xrxrgn3Esvj6AuPzh85Oxzg37wvq21dihPKSIWXtxgyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4451
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE1NyBTYWx0ZWRfX8J7E5M8iRs5J
 K6NgbFZBVHtq03jjCL5uHV2A8j/TMUuohfSxBqqQtVkUOmAsFFNflcqmHTmUi14kTRpiRpcOhXX
 YIJUNgPtbyRPulFUrsP9XrPIezBf22eKBl4pGnOth3eUcfpUWxW2v7DJe2pWokVfYYwzvjBBMI4
 egmE+LPzdQe/wbzbtt+MJYRn+DIrODpYryzgHOsbVUqzl9eMgAr6jP6IdeEVAlnSWNK/Z2n+M7v
 xfvDdl4P8vlfjHusPKHD+/JlFSg5asX/hob6MY0Wz8bk9ncJjfjUckzyjUH7zYLLeL5ZBTIBCwG
 CzntB17L/1tyCAKdsJ1R0E+vXMnhyoADAb4zgtoAk01uIFxRK/ImmcHtd4ERZrbp1tF8SNO1urd
 QJSre+wRc6ANibbi3Zn6SR38RbgpIOeNiU2+LEO7kaYc2GEmxyNeRCTnJYtal/tUhL28LmH2Dx2
 gGqX1N0VP7sUibzbWwQ==
X-Proofpoint-GUID: Xwrbj9lMVefHqBkEiwYSGCvLnMRPXZer
X-Proofpoint-ORIG-GUID: Xwrbj9lMVefHqBkEiwYSGCvLnMRPXZer
X-Authority-Analysis: v=2.4 cv=KLNXzVFo c=1 sm=1 tr=0 ts=698a28a1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=15yIpirbljyiBF1XFqEA:9

Kernel commit a544d9a66bdf
("tracing: Have syscall trace events read user space string") (added in
6.19-rc1) causes special fields to be added to the tracepoint format
file for data strings that are faulted in.  We need to account for this
when determining the number of arguments for syscall tracepoints.

We introduce support for a valid_arg() callback function that providers
can implement to support skipping initial non-common fields and also to
stop processing fields as arguments.  The syscall provider uses this to
skip the __syscall_nr field, and to stop argument processing when the
first dynamic string field is found.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_dtrace.c  |  2 +-
 libdtrace/dt_prov_fbt.c     |  2 +-
 libdtrace/dt_prov_sdt.c     |  2 +-
 libdtrace/dt_prov_syscall.c | 42 +++++++++++++++++++++----
 libdtrace/dt_provider_tp.c  | 63 +++++++++++++++++++++++++------------
 libdtrace/dt_provider_tp.h  | 11 +++++--
 6 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 9ef001a3..a0bf34c3 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -255,7 +255,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (f == NULL)
 			return -ENOENT;
 
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index ed1bd93d..59e4583b 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -526,7 +526,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			goto out;
 
 		/* read event id from format file */
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index f9de2cf8..b1343481 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -202,7 +202,7 @@ static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!f)
 		return -ENOENT;
 
-	rc = dt_tp_probe_info(dtp, f, 0, prp, argcp, argvp);
+	rc = dt_tp_probe_info(dtp, f, NULL, prp, argcp, argvp);
 	fclose(f);
 
 	return rc;
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 4f1e206a..5dcacf60 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -40,11 +40,6 @@ static const char		modname[] = "vmlinux";
 
 #define SYSCALLSFS		EVENTSFS "syscalls/"
 
-/*
- * We need to skip over an extra field: __syscall_nr.
- */
-#define SKIP_EXTRA_FIELDS	1
-
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -186,6 +181,41 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
+static int valid_arg(int fldc, const char *desc)
+{
+	char	*p, *q;
+	int	rc = 1;
+	size_t	l;
+
+	/* Skip the first non-common field. */
+	if (fldc < 1)
+		return 0;
+
+	/*
+	 * A non-common field with a __data_loc tag and __<name>_val name
+	 * indicates the beginning of the dynamic data area.  The previously
+	 * processed field was the last argument.
+	 */
+	p = strdup(desc);
+	if (sscanf(p, "__data_loc %[^;]", p) <= 0)
+		goto ok;
+
+	l = strlen(p);
+	if (l < 4 || strcmp(&(p[l - 4]), "_val") != 0)
+		goto ok;
+
+	q = strrchr(p, ' ');
+	if (q == NULL || strncmp(q, " __", 3) != 0)
+		goto ok;
+
+	/* Done with processing fields. */
+	rc = -1;
+
+ok:
+	free(p);
+	return rc;
+}
+
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
@@ -209,7 +239,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!f)
 		return -ENOENT;
 
-	rc = dt_tp_probe_info(dtp, f, SKIP_EXTRA_FIELDS, prp, argcp, argvp);
+	rc = dt_tp_probe_info(dtp, f, valid_arg, prp, argcp, argvp);
 	fclose(f);
 
 	return rc;
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 1faf5cd4..6e0d908a 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -123,17 +123,16 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
  * array dimension specifiers (and those are part of the type).
  *
  * All events include a number of common fields that we are not interested
- * in and that need to be skipped.  Callers of this function can specify an
- * additional number of fields to skip (using the 'skip' parameter) before
- * we get to the actual arguments.
+ * in and that need to be skipped.  Callers of this function can specify a
+ * callback function (valid_arg) to validate a non-common field.
  */
 int
-dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
-		 int *argcp, dt_argdesc_t **argvp)
+dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
+		 tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp)
 {
 	char		*buf = NULL;
 	size_t		bufsz;
-	int		argc, common = 1;
+	int		idx = 0, argc = 0, skip = 0, common = 1;
 	dt_argdesc_t	*argv = NULL;
 
 	tpp->id = 0;
@@ -141,10 +140,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	/*
 	 * Pass 1:
 	 * Determine the event id and the number of arguments.
-	 * Skip over how ever many arguments the caller asks us to skip.
-	 * We will skip initial "common fields" as well.
+	 * We will skip initial "common fields".
 	 */
-	argc = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p = buf;
 
@@ -205,7 +202,31 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			common = 0;
 		}
 
-		/* We found a non-common "field:" description. */
+		/*
+		 * We found a non-common "field:" description.
+		 *
+		 * If the caller provided a validation hook, call it with the
+		 * current non-common field counter and the description text.
+		 * The hook returns
+		 *  -1 if the field is not a valid argument, and no additional
+		 *       arguments can follow
+		 *   0 if the field should be skipped
+		 *   1 if the field is a valid argument
+		 */
+		idx++;
+		if (valid_arg != NULL) {
+			int	rc = valid_arg(idx - 1, p);
+
+			if (rc == -1)
+				break;
+			if (rc == 0) {
+				skip++;
+				continue;
+			}
+		}
+
+		sscanf(p, "__data_loc %[^;]", p);
+
 		argc++;
 	}
 	free(buf);
@@ -232,7 +253,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	 * Fill in the actual argument datatype strings.
 	 */
 	rewind(f);
-	argc = -skip;
+	idx = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p;
 		size_t	l;
@@ -249,7 +270,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			continue;
 
 		/* We found a field: description - see if we should skip it. */
-		if (argc < 0)
+		if (idx < 0)
 			goto skip;
 
 		sscanf(p, "__data_loc %[^;]", p);
@@ -320,13 +341,15 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			}
 		}
 
-		argv[argc].mapping = argc;
-		argv[argc].flags = 0;
-		argv[argc].native = strdup(strp);
-		argv[argc].xlate = NULL;
+		argv[idx].mapping = idx;
+		argv[idx].flags = 0;
+		argv[idx].native = strdup(strp);
+		argv[idx].xlate = NULL;
 
 skip:
-		argc++;
+		idx++;
+		if (idx == argc)
+			break;
 	}
 
 done:
@@ -413,12 +436,12 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
  * the argument types for a given probe.
  */
 int
-dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip, const dt_probe_t *prp,
-		 int *argcp, dt_argdesc_t **argvp)
+dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
+		 const dt_probe_t *prp, int *argcp, dt_argdesc_t **argvp)
 {
 	tp_probe_t	*tpp = prp->prv_data;
 
-	return dt_tp_event_info(dtp, f, skip, tpp, argcp, argvp);
+	return dt_tp_event_info(dtp, f, valid_arg, tpp, argcp, argvp);
 }
 
 /*
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index 406609d1..bf73d96a 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -33,8 +33,12 @@ extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
 extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
 			    const char *name, int bpf_fd);
 extern int dt_tp_has_info(const tp_probe_t *tpp);
-extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
-			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
+
+typedef int dt_valid_arg_f(int fldc, const char *desc);
+extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f,
+			    dt_valid_arg_f *valid_arg, tp_probe_t *tpp,
+			    int *argcp, dt_argdesc_t **argvp);
+
 extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
@@ -44,7 +48,8 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   dt_provider_t *prov,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
-extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
+extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f,
+			    dt_valid_arg_f *valid_arg,
 			    const struct dt_probe *prp, int *argcp,
 			    dt_argdesc_t **argvp);
 extern int dt_tp_probe_has_info(const struct dt_probe *prp);
-- 
2.51.0

