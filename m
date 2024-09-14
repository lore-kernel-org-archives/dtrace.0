Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C05208DA
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337455; cv=fail; b=PfZbrmMjN5sVAAM3cakjfs7Uhp4C3CjfpxQS8zjR1sotK/5+eO7uV4mbtBykTWzVIiewLmqrgzKD61q3quC4+TYOCKF3dhtx2R6zqGy7wj4ShzlBmkTNkfK/8cISXVYGgxebggriULMBI1Satu8789IZUqg9MDDPRTAiOQMLhbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337455; c=relaxed/simple;
	bh=n4FIxdyGsz7dHne54NJ5AV7fKPmxLCBnWGz/z3znDNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XRsdqGFo1USjbxAFPhCWm5QI7ZaLdAJ0J/GCxWOIxuPYCEycF1m4NJbYbpeJ4ez35l9jPhBTUwCe6SjCgkH1fDQzqOvTb5TqiLH0UJ1lDa0T3QRrFZ3NmewWMrOrOWShp4Ng1DXw5FsdRHTOew5P4PPW+WGHrjc2YZT3hnTP+wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k9Ug3srl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QWET37K9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k9Ug3srl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QWET37K9"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EACxei011350
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Za9S9ZpgEQoW48a
	Hb3g2CC0iaVEs+J4S91d/9NDeQtU=; b=k9Ug3srlLttnmRsWzSpbhpZtJeysq5B
	Dv/RN8VQFLrWckb0R97T2V8u8I0lFkFEdurEJ7npHsF562wHec+zvYR7ipeTLmwy
	0GtwW12qRhISQwowrVsj3TjjpIeIyQnUGJMvZNHHPx89RmzxW0evOhYJCDCOWEWK
	ZYV/HzLZbqOJyQcrJgE1OFINFI96hNharCyMolygohfk2YaJ5/skhImtNeZ7m7jZ
	Zayh71bZmmrC9ntJnj418wi1n9X7ASVQ59V+0GHeMBTwYUvmF7tKuAL3c/G73yKw
	iBy0zQ8OK6eTlh6bPEZA/7h6Rl98ZlqBV4B0bWKQgLkAh3DEhOIkzfw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3ns8nnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:10:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEouNf012854
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:10:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6nq05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8M+p5WInwhKJnkQ+bePconFq0cWlilkeFo8UDNuQ236oatkpnQiOOlO2kYiDkV7tGg7UM4UAbA5vRRHlDCbNidGlCMAnw7qb5ku7D7PPqPBZm3YOIwkGn/udFEJjRQi7VAaGqIPy5MldOv/wJ2l7TXwFnhbHVXJYeFMDGtSpZK6jsX5GyIH8DZ1vYlzGfN7cfYz67PbxL5gBQdeSKCMgeRZ+1sJo1c8gkiePjUWeUGIJ0to0qUiYMH54/fh85DJiOb4bWuF38Ve7fqDhTF688jrJQxvVEyHUdhI+oelKuFPVuRv3hDUHypkHUCW5bDxHHkcOl4s2EG/HgH59YJrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za9S9ZpgEQoW48aHb3g2CC0iaVEs+J4S91d/9NDeQtU=;
 b=JZ2AzzXmay5wjlMDFI4zAAkVtjSGbdDJqxyxAbt2rt1n3aBmXzb+kgTOWLuFHk5o0oY2FW4XTEd+53IoTtMl3fxESfie4ncEfpO37aoElSFKQ4M27lbrjWldykQOY9TQo61XX6mc+yZ+bAK/BIYWoWi8DreOmNfsbsW/fAseOSxn9B71sU1Hl6COzr0Sz6EvRcVks5+6jdzBzHcllOJ+j0FkeVN7HZK04+5dUU+GW2kcbbceXfvWvhAv36oYmX0d3f3d4hBTMuYwnZ4rBkYUa/V1LjnAS5dKfRJnhKfzH3duaU4ytFV/D0Us9Qpgu0g9pSTn2Ep2ADTQxEADec60cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za9S9ZpgEQoW48aHb3g2CC0iaVEs+J4S91d/9NDeQtU=;
 b=QWET37K99HyUVoHbMCKLd0ibDBQe+87lbcRGlKVcoCeL3ZuskWL8/zVEnmTws3Y143fnjx3BvUsJk7DsTyzk5uIWBNw2CO4SL6KyJfZyDY7W/OkBOC8iD+hc4VIEqMyURdmZ9vnb8yh184eFtyt9uggQkEXzJlyg8vevvIJU1eI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY5PR10MB6216.namprd10.prod.outlook.com (2603:10b6:930:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Sat, 14 Sep
 2024 18:10:48 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:10:48 +0000
Date: Sat, 14 Sep 2024 14:10:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 18/22] test: Remove tst.DTRACEFLT_BADADDR2.d dependency
 on specific PC
Message-ID: <ZuXRpr6T27xeqhlw@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-18-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-18-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:208:335::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY5PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 880ad2b7-1a3d-47e2-220e-08dcd4e88f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?echsAZQ0uIHEq0FEWi5Z3X7hBcWczG8yHjNJMN/mQnmZyH+vDLi8P8+sBEv5?=
 =?us-ascii?Q?AKmGlijhGTGNdJde9f+lYHwhSRC+YyjKLUYvoCiLEFpDbTTX415v74J2CSdx?=
 =?us-ascii?Q?ovsUWUB17CEZyQGR4VOLcqaKAw8J+3EYc8yVQ5CtQhBXh/3zXUnOt0WKjxFV?=
 =?us-ascii?Q?w8MuWuI/sKFoI3RpglcwscD6PffUsROAQPEJO8Udo8os7Q8ZAMZ8GceAQqAT?=
 =?us-ascii?Q?TMGnf1yJq+6sq/IIoHoaaPAmADxvicKYjPL3/PBPI6bcdYpGmSWdnAGbswm2?=
 =?us-ascii?Q?oXJvpJIxkffI+MV6SYZ8Ea2CQAASc3x9IDEyN4BR0xJt6PObVWzgW+iGdDwe?=
 =?us-ascii?Q?+CNoKVhyNwPK7Ktvuxmopg5zQ46UVH3eE6Q3vtTDIEaPqCVGT4ScJJniTHQ/?=
 =?us-ascii?Q?P0lH+Pzt8i/0p2RDw4V0gB99t7jK+CtXJeV91GgNFLBfh9f+f2EcMSjH2OYF?=
 =?us-ascii?Q?EH+lX/IxKYAn5+K56oSqJUM3rg8zgXK6rf1Yey2ULdBjaqF91D3PmnSa8sZ4?=
 =?us-ascii?Q?sW51KpeBoCl9ZT1clM933XTLfrtM2VFaUua2YdWyVdivZKD3QrJN+3fv9XE+?=
 =?us-ascii?Q?L4kaiPNmHJQ0F60zLXw6lyhWLmc06yj80kuEQZcn3p8a6LWs8j0sSL6LVkBl?=
 =?us-ascii?Q?ToINGPx2V+1x5CZfYqi2sWIRPGv7ewW+znlIU+0ge1mEQ4ZwvqWacfaMZdKI?=
 =?us-ascii?Q?swdfXsl6PSQ1R+89W2gqTcf4qROFKRsdcGKv5M5RErf9dFdnSfad3ZzfPdAt?=
 =?us-ascii?Q?wpKlbvdPJQiDxq9th3+RwSGXzviBCJhQmc0btWHJRdSl1rUt4ccn2D/RzzY8?=
 =?us-ascii?Q?0GEB/UdcnL+Gr+v87c9xG3oRG2O8i2S+4NyN7IzK4Gg6tQhpb10yTdMPc+UX?=
 =?us-ascii?Q?r1NtJWtt0slnUq3itYUVTRSwpT054y5yv8dsUDpbhZuHK8ObJUVLzHf1iT1l?=
 =?us-ascii?Q?yJjCsAoOlTkpJVebhAQyYymXQifrndOB8TWPTuIjFHbV9Nau+r2ciIrTCFt6?=
 =?us-ascii?Q?4asBlrAo6aFCfBdHX9cNOcODWuGN0C6Q4+Pk++WIpFvp8AgFTHaKbu9JJFIX?=
 =?us-ascii?Q?+pVcAlfSdHY1Gk636Rp+DpZ08Dbcn0NOpzKRgqKLYymXYCSJHsMb07taz8mC?=
 =?us-ascii?Q?Li3w/wm6Yl1T9HcGoC2BSdi8guP9Tfpwh8dx6VPImZ+x7diblhBUFlQ2G1Dg?=
 =?us-ascii?Q?chsi/65ebDX+JA2wZM+qvCCp4CRdYHODOYqIr3BDu6h1F/VETT3QYoJdU7Qw?=
 =?us-ascii?Q?J0AS0OR3ItEIaiDYvF4ptLmH3dfzof3e4KLgljjuqzlPuaEYqO2L9BR24ez8?=
 =?us-ascii?Q?RtHY9uW0WQu/ZLD2Eqb9zlBCnMqIkg7UvWHMUcCVy381FP23+Sktive112sF?=
 =?us-ascii?Q?tjPaim8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oy6COwyYkAUR8Jv7lMoOPyXnhvrh5xfFGr2au3l7GkwvhiU1T7Jx4ng4vAgg?=
 =?us-ascii?Q?58kxMZhQLs/ezVoGBYWIRlZBq8j7bh8B4clqh4V0888B19gAFpGW6IB7XjSK?=
 =?us-ascii?Q?MQl01a80PnBOkFF/7dmIF39HcgAwkwjQLlM3SjZlHdeUtzsOthEdb7sChOl4?=
 =?us-ascii?Q?WfMP+sW9ESy64Ftyu/0eVjcVuuTMyWlhExfZL8mO785p8rEL4xPle/xXvJzt?=
 =?us-ascii?Q?lCYd+8shR7juYi+qBjF1H1tNo8+TJwdEiDr7tDlOoxi8VtP1k3qPHxKqR/P7?=
 =?us-ascii?Q?6jA19niajA7b/+f0CbrTDss52BPi1QHk/9UA31Iq+Qj11oah9sDH3zjFPzeD?=
 =?us-ascii?Q?htmt5WtsrW0pdllSZ4/Mjy1uLdHSAJ/ZiPRCyf4RYDIWYuvVJ53HiyAufrTO?=
 =?us-ascii?Q?TTOqOk9h/cy6ruHFMExfgFLXKGBcAJOOXVy4rhSM59EJOVSIVrEFI0OVWFyT?=
 =?us-ascii?Q?9uvA3ZW4z+XO622bC8UKyCt927wWIIK7UfhXSGhC35l1w+2pZw4LtfYoBR0b?=
 =?us-ascii?Q?V1hYbhNjNZ3g5Qn+i2V2fEZWKJ32mxCTUmwaQeUWHdSv0XnpDEfmqw5RPAPz?=
 =?us-ascii?Q?yRJDqz6M9GOy3A5C2mFmTdm3o43wuBcjf4aWxU0eFdma9ZhwiyQzPl/mQhmz?=
 =?us-ascii?Q?1CL9y6+vL8GeQQr8Vl34eNdioksJ3d5ZtyrfxXYUCEB6oRst4uVqTgcJml+I?=
 =?us-ascii?Q?jgK0h7TJosOGmKwUBI06V2FpPS8TXYc30WObe5rejSTflGNbfd9HZT6mznT9?=
 =?us-ascii?Q?+2lsZVDlrnrFZ7yrgpN9bKpKkL9mPDieZVJaGKj4feuNAGbKDjxAN/AZDKMj?=
 =?us-ascii?Q?rqxrryejGZjcGBTy3LRuKXE5QqYJFWvpQw23LQLaTIc3p1H92bpsglNbfy+L?=
 =?us-ascii?Q?L29RCHY71C61MWrWn7DeOFwwM11JLEPDQ5QFdJV3Y16erYu80/XlgqceUzwE?=
 =?us-ascii?Q?N6ltlzkY7kvWffOhpSwrk2lyZSOIgzLgs6pTM8mlJI645nYyQqNFrAgPtG1x?=
 =?us-ascii?Q?tvS0jadrxkyLA42W4aOqCCflc/KpAAkFu0kso6HGXvC8tWWHX/x5MRPLxq5K?=
 =?us-ascii?Q?/yTAfSYBZ8ml6nEPmc9Av7SeuET+1Qpaa3Aspcj7ED9qZdPRcuEyerC5Ks1W?=
 =?us-ascii?Q?wy0xmdC0CjozP0uQYzOryS5yZcEMsfun/EQHGpwTDHq3LT5Pezjy+e5pfhR7?=
 =?us-ascii?Q?DknvNoctV8WpRpUdFdqbEEAGRIDxL3g3HizA/pGTlF1fAUA2UMsX2DUJg70I?=
 =?us-ascii?Q?Vjj2SeS1Ipj2z2rDgMXU4xfmBzzVkUri37lytGgjkhIN2Gu64+lPIQXmXslD?=
 =?us-ascii?Q?9Xm7dGNWBtZxg1UVaHedvl/t+XRezV3b8Mt36VQqcDMGslpLjD1Mf6JGrjtG?=
 =?us-ascii?Q?oMsWd5wg1+B1cS20iLWJacPFvIvR73MjQ1+zG7bvs+AAOc682Iy3nkD5Kd+0?=
 =?us-ascii?Q?bbyXtUQdhMoRipFApUAylU/irSQYxNS5c3O9AFufrRdE6Hew5eTzrLuIY7mv?=
 =?us-ascii?Q?uR/NQRQAjutwPanLWT27xWpYYEazblQo0IUFnBCEU84QXhaLXmYB06xSOwQp?=
 =?us-ascii?Q?TNc6lZPE3NmjMaFdJm4G8bAKH1KWmEox3HHsD0KQgcVHV6BPNEBY4KFheBg7?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F0dJmqEMyxjt7QJZplq+QWfzTso+aew5/uIXu0nRW3I1Fe8sFWjZq2e0o/gNpvgJWGdPzIBzgElp9sw44C/VQd8sMhb9MDyZIMMU8dB2mZzObT/DT5+1l2ai7mWjsO7hpqwSxGl0bpPwsgtjvRzPkn22GBSmTi1Rn4JiMwlvzmcyyihiOSU5b3ZybmT1JaabAAxun1NdSX3ebLYiathJE40RAE2koOZvsJz/4hVDW0rsyDI0BhYm7mjhY+xVGNrA2OIrsCxT+G2S9zrfyYmXw3ii5wEFrNa8uDz2VdjjVNJanlSXZiXaOWDhdkCmToZ6zzWYgXn6qAJGL3gfmxBiL0/80/zoIvaofNsu05FumrA1YTuAZJJM17v0r08+ejU41nu7KoFKe8CHZDwjI6A5st9jdG+wpDpGtLa4I4/dtedK5Ven3l3JclmRAsDBw4PL14IqmabZCXPPQE10z1OgG5aInTa/8+y5hPcviIZ5fcSW4grV7i0oeqgZQb/PeyJ395zZB7IH8dHthUjepo9dUfDdKB1FdeFpiVY/+9Q4h/Jv41dvxA/WJjdwOT96gw/poFQ/oNOFnW6bt36Rs+4SA504WabuUWJGTSiVndYGLk8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880ad2b7-1a3d-47e2-220e-08dcd4e88f79
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:10:48.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DNBxEYbjsUenJwMC2MNJAxtgensEUPUdx1Fvwisf5LAgFC+lHFvzqBNBPLiB6IDAt7LmSDwjtqlWgWIiXaGXehIalaxO18rqqKwRdMqMjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140127
X-Proofpoint-GUID: 94YqcpRx1hLB9J4zzXxd9v_e7npjkVQo
X-Proofpoint-ORIG-GUID: 94YqcpRx1hLB9J4zzXxd9v_e7npjkVQo

On Thu, Aug 29, 2024 at 01:22:15AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/error/tst.DTRACEFLT_BADADDR2.d | 12 +++---------
>  test/unittest/error/tst.DTRACEFLT_BADADDR2.r |  4 ++--
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
> index 23663f3c..a822e63a 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
> @@ -1,26 +1,23 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  /*
>   * ASSERTION:
>   *	To test DTRACEFLT_BADADDR error with non-NULL address
>   *
>   * SECTION: dtrace Provider
> - *
>   */
>  
> -
>  #pragma D option quiet
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u %u %u\n",
> +		arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
>  	printf("The value of arg5 should be %u\n", 0x4000);
>  	exit(0);
> @@ -28,9 +25,6 @@ ERROR
>  
>  BEGIN
>  {
> -/*
> -	x = (int *)64;
> - */
>  	x = (int *)0x4000;
>  	y = *x;
>  	trace(y);
> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> index ada685d6..6c5fa119 100644
> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
> @@ -1,6 +1,6 @@
> -The arguments are 2 2 4 1 16384
> +The arguments are 3 1 1 16384
>  The value of arg4 should be 1
>  The value of arg5 should be 16384
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> -- 
> 2.43.5
> 
