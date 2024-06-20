Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959A1AC248
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906051; cv=fail; b=m85vZ9PNN5U67RJRHhLrXui6wMV+w+ipovbgFN76zHIEXc+P3H3K0d+Fl4ro5cZesFXnqnToZ2YpKFRLPZizMNky7upSnnZQq1JDMUGJ2eiI5urNEhDZrCXpN8+EQj2a53m1Ic3Qfu8/houNEqiEyx3Oa7Uv2U4XMOBErDblunc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906051; c=relaxed/simple;
	bh=6/gDO/Y0lhlvsqNEXKpw08TAzfUq8BnahIL3DxKtuW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qaUU34zJmClR2tFyRH04fBdORhSwaCJdhzaJytjsbVqmnwRckpEKf5smjCxoMi+L99i/PcKId4MEPSLrRNN7TflAPOJ0VMqh4wrPqzCjJqeE1TcPOpfprSiLMrS+wmow1za3oCFZYxHa8yhJI26xbqEMpzKdVS7EF2Ifd8ap5d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UCXTu4Pa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k6bvWnhE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UCXTu4Pa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k6bvWnhE"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBVnf024309
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=NfdeU8h8wwoV4gx
	Cn0SbD7QlbWgMg+j3hYc6I5y9Czk=; b=UCXTu4PaTV+2pfNlT70BFu7nbACKT/+
	vf65OY6Aori3S6TPkZHuFtRIlOLs4bBSUBLlkB94z2gUemsooy5uDQo33QUT5Zk1
	6tIwBUf5xXIelkU+wFCbx9Fa37GafRwkhVsUVXGsq3scuYJgbIcD33VneWQ3z8+1
	4ljhh6CZYGsg4n+N+JIvQvfVbAUt1cIGPOxl5W5aWkHvHnHj4AVR01B6jGX3SdID
	8TBIY/srn+sOFsAtAnnTzDk21Db7OrzMj29Iy1N1xTmCIyPsz1TFooIFR8dIPT9E
	s9bXVLby6DHndcIaxC8YLReurYgn3cITBlr+jfyLklQq8F2T7UkMmag==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkjr2p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:54:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHEVol023844
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:54:06 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn7hfxd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5C3bmCU4fnQR8nE0KecIwe+41WgT7MT1TJ9JVLpblPjn5zY8AC/dT+Wi2l3yroBIifNVxOy9ujWDVIt/eA2gPSBcooT+KD6DjXi14Zg/ziVYmN/VYM8q4v89YN6Fy6UcCulannVcljUmE5mqj3n4edw0H0ktWbOx9/Qw0IoE/f41oSAHLa/XGmZi07pBEZJJ4HeiUDIUCPpIfxJaPphpigabSCZ2akv9zjGG+l1ghINM1Kga9IYVdGoEbu5Sc+3Oy/RhR8P9msdL9Vpv2RktQ+ExyGOcZdiJmXJTdzc6MiQ1RzpxmPlRHorZXTcKJV1JkRmExTIDvzizNpm+NC+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfdeU8h8wwoV4gxCn0SbD7QlbWgMg+j3hYc6I5y9Czk=;
 b=mkmm1avQcLh8jJRgsovjVH+rxglSDVE44qmabPsjrL1rW08ETTD+GKlkiQrFGFU9tTMH4wiY6tN/m3iOZmA+dVIHVX1D7e1+8ByKMfRaqShjYXEmYZERerepWn6plIVCW4H6q4ZzuWgyfV/clUCR+zmPP5OCF8RWCWZjuGWulx2aT7ZIB+7LD6KihosvBcfrmnhrCr74roxk4E6SX26v/49Hef2lSrupxe+psmefeMG/F+3XPDQn/6mzPT6US1uO5J5ML2t40q5yB/gGvf9nePlgNB340v983bu/P3nBD97NFcVrMlyiJdXMuuC7Gf2EtxR6oU2iaX1L5wNahU4cLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfdeU8h8wwoV4gxCn0SbD7QlbWgMg+j3hYc6I5y9Czk=;
 b=k6bvWnhE2MhYAY43XOmS3rfXqipbja7O6sLMaUzPKxLtAooTzS+SAAYDD3EvOOB+k51iCkm3ILBMC7P1PBS1tM00oi4l8fq9LqGk5aU1XB+71xrYCaiaxLRy3aIYPoLvDu/BkyRtau9kOiiGrbkUjhfiKtbJ7KJALGegTId+qqw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5091.namprd10.prod.outlook.com (2603:10b6:208:30e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 17:54:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 17:54:03 +0000
Date: Thu, 20 Jun 2024 13:54:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/2] translators: support 6.10
Message-ID: <ZnRsuWoGg3DkX7RM@oracle.com>
References: <20240607184155.316904-1-nick.alcock@oracle.com>
 <ZnJRYDRrlwAsNRr7@oracle.com>
 <87cyodaxau.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyodaxau.fsf@esperi.org.uk>
X-ClientProxiedBy: MN2PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:208:23e::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dc0b3b-d8e3-4e39-7a33-08dc9151f914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X019e3c5h2tXJ7/0wWXK4LVTUI1MCEo8wH6HCPFDgtnkILLItVtRnRiF2V7P?=
 =?us-ascii?Q?8U/VsmNWO8HHp3Ll24AQ4ONDW+2NI/pVTp5Q5WePU7EKo6Xt/4eXT4gpJfYy?=
 =?us-ascii?Q?VAEyFbL25L6bF5XNUmBSR6MxqM7TdOQOKZR/v4K6vUELPQLP/CnkJnbU2phZ?=
 =?us-ascii?Q?biljDMgz7DBv8fBHd+ALOZjLI1A8kUYFKT7FTXL+vmjBXu0rZXt1WEdUOo2c?=
 =?us-ascii?Q?oRnGX9/7ZfGQOcrptUz0SXoqHkUmXafB5ulloZXOTsw3EY7pzYnwa3Tpc1gz?=
 =?us-ascii?Q?rBqXKjUQYDlCO2rmie3ceNG6s4sRqqHYh0VDkM7ByAPGn03cmMabh5/bdYfH?=
 =?us-ascii?Q?f1Q4imtFfDNyjB4imVogHvmy8LQKgW0Oer/velrRZvbPxjW2bvYjQfB3aPw8?=
 =?us-ascii?Q?ubrj1deT9PbGifV28iV6j5tZMw2GL1R3wLNG6xVDRFVAZLvw1HkyyMYD++Gq?=
 =?us-ascii?Q?9pHAZhkLr7y15bVeUzzcKndXWQqlp1wgWKyZKYDJNJol7PqCEgi+/JXfyzq9?=
 =?us-ascii?Q?8l/VhOb4rD3JuaBXl59wmRpaJGVAz54isiWUqh1b4GJfu/HbuaxdSnA/QbVJ?=
 =?us-ascii?Q?NXmlRCMCfv7x+WYNd9daeGGrGAOe4m4sUwFSreY5e5Ow0acvMup3Mvp+iDc6?=
 =?us-ascii?Q?IDGfeO53twVQp4VmiPHYgkZYgTTGso8lYfJ4qZaf8PW0zb6R1M2/06OVx2FK?=
 =?us-ascii?Q?6zR6n0kqn7ijRF4U9WNhbyVTJfE53k4+KXVkYZ8rnrC3+Q48a9Fs6OFE/fU/?=
 =?us-ascii?Q?sxX7N/oMzHuFggfLeDKlt20t5VIWdeVcDeKlu0Cr8zIXKY9R9Mu9zO0QNd7U?=
 =?us-ascii?Q?3twBYkQUoSZDXtUztb2ag+O+crd9FhvuJZcSwsf1aHvkR7VeWWSNSFw2FjFY?=
 =?us-ascii?Q?siI+T2WPCWdLBoZgn3ZMB/6/uczs0gOuTkmd7yMhWWML9IKJOWNN7bDFgBKs?=
 =?us-ascii?Q?PpaYAK+MxMpHXiNuvX/YzQWxjsrW1wDlg6W2/SrPK/fvHfCKKrWMfVgQqlCJ?=
 =?us-ascii?Q?DnFmXwCESwIEwzJCR8H6To3Wom+bldTL0u2p7uyGNxjbWqxomR9HYHM2HbIi?=
 =?us-ascii?Q?/iiGG94nZ5w3nrPpAj3qQ1bMDXKLCzWVNe8yROOFn/rYq4tH4iCJY5hBQaLs?=
 =?us-ascii?Q?bW21bktVegPCEkeB4oM6BZXre2nSJRooFgvdN5rZ1IjHzRTvmk3Vw4yS6wa5?=
 =?us-ascii?Q?GPblVz8U06Ps8ikq5/ktbJ6ptYXubLKAfQ2/+nRKuGf128M7ZDNX+qADJNKU?=
 =?us-ascii?Q?/SQf33Rbd78yYml/0lzWIO7Th6qPEuKy8XtH4pPkZ2MW5Qy0Ul5dsqzfVINY?=
 =?us-ascii?Q?UTU0/x1JMMl13XNEVgo7o7es?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9kZX7LQARFo7JlzcbTaD6OS+NzNcXzamCZ9iEdETfGQ+VUpNZN6SzeVwoNxs?=
 =?us-ascii?Q?Wj9PN4GoxXuX/L7M8HLoAAksfOdRGnr+zWz6g7nCsRz0H9pbzAHQm+/gnqlv?=
 =?us-ascii?Q?PrY+DQljIxs53akbXmEQW1P+LdSP6LnOpwEkp82iwm7KyYB/wDUd4A983OOM?=
 =?us-ascii?Q?SIX/WKQ3sCHiGFrKn/YqsUiQNtN1u40mV2bUGNhYWiRGDloVi3wtTmV8krql?=
 =?us-ascii?Q?4MS9fIC+TgJ7yHTJU7yOwH9BOTnq60nKE77ogLcfEkDJ+Jko+2jl8ffypxDd?=
 =?us-ascii?Q?tTIPitZ7vgx7HL5n5WYEUIIWsfziMXkPIX7zSwQWI6rfhp/Gotjd+YLovfw3?=
 =?us-ascii?Q?hlCuX/6Mp1fBxlLpMTzJueAcpMh0kW5KoLYqWpTeajzCatCqlDlzrQfJ7oAC?=
 =?us-ascii?Q?v4iZsbrQngjCWwuNLphwkKe5M+gHu4DAG0gqfQDsw4ayFiIvoGQHeGxaIyqK?=
 =?us-ascii?Q?bmrOBoHCpYsER/KJ3mlFaQ2cc8ycTOBG/WTusSHU0hvbAg36nix/GQAOQQKL?=
 =?us-ascii?Q?7T1LS7nBza+w1fC7i+0RYIVNjzsmm6pcc0QL2LQPGn21yoK+oOkOvu2wNLyu?=
 =?us-ascii?Q?WyQzKyRphr+Q/5Q4+knLAFE6oqAd/ikvbnVpjGsPHdO2GMriQzUd50eyFcXJ?=
 =?us-ascii?Q?bjw61XU8akviS0u+2rjN2oGlHCNmTEoJaw2rS39uPoRxnCEuaAG/id8qTF9o?=
 =?us-ascii?Q?IjourSjJhJVHZbSUYJiAGvpXF7PIOdtvdDNGRMWV2D83pqNt7SpSHzg9SraC?=
 =?us-ascii?Q?mP16dI+NDwdb2dzd6F1+IWOyJRBiUBQ4yd0SRyTYS/NKD2l98Y2q7Mq4i3HR?=
 =?us-ascii?Q?MCY2ii3sEnMsP3OFcuakYgW+YOcNXWjIVBa435zR5ucVZneWrFXtdDJqhO3N?=
 =?us-ascii?Q?/4o+PFSMLS+G/YWgCnpyqYVAJlSDC9pjVJ4HtDhPBvadlTtNZ00SP3xK1sqA?=
 =?us-ascii?Q?NIFGHDSYFzdIlGNswMKKF6nVOJ+A8xpWEZn2mJqDFUCmF2w7Eg8Hlsz+ChUx?=
 =?us-ascii?Q?fNKUpTC2oc3YVJJFFuoXqFHl19b7Y+GH9XrgWtCUcn3g8OfVXVPSxyuzw3/a?=
 =?us-ascii?Q?n1Gg00q3Bak5uOjtleDwfmgz40UgLD4c1d9MU/22HyG6V5c2ulNnYMH/nIdI?=
 =?us-ascii?Q?kASpCqOhYVArVJCyZIB9S3bPLsIbRMmtwpgp+1dPGLM8YMlGfUGxIcqdUE1/?=
 =?us-ascii?Q?UOTxYEBq8XZ/RJ0lsKic8MOgTreyQRYZMvfqRPt8zoiv3SDhSLqiM6eDqLJn?=
 =?us-ascii?Q?L8X8RJPolpfINCzGa6lCFe0vKp4kYXZXeAmEVcRWV/Lfj2qEkD2qfF+Tauzl?=
 =?us-ascii?Q?kS6PnHDzguNZDk8oTPTErpKnhe8wFzKQ0Q/MZtuv0a9BNmgwkTdHpzJZDZJb?=
 =?us-ascii?Q?xneZmOCaawkILy2NmIt2xUZfiLOit61wccWDlMvTuFfk7UlrmC/98DH9nN/8?=
 =?us-ascii?Q?A7d8aUp9gTk7yrk4ZcKCL1z1hVPN9ByTf5/UQNGvWf9+DP7q/j1C/fNCEAYG?=
 =?us-ascii?Q?l8sW3X87D//nJH2UUSV+JujYO+h6selo2MPnA4RKBfogF/pUFctWpU0JsFU1?=
 =?us-ascii?Q?K5wQhOQRWsaPThbjD1V83D/OiIiU11J8JX5rgdAeGwalggbKEtoKEkLM5RrE?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SssRBxtQaghOLKF3ZOxjdLJK9rZ303n93YJQZa5FN4pFLjU+7dELNC82XelZvWxnKeM5gKdRC13vJZu/GpoG2xIVqJDDQ9ttJwluD2+2YZqXoG3Y84ypsCV+ADQLBvuXxyG55vgRBazBWTlkGB00pgvDmegwlVBWRez5oB/4w4lOVlQLc0Oz20PxFucVoXPlHdEYuKsYQnO3A4MfNJYk7ciIjl7ddnB43xPqXGftpxLd0KDJjwNXLJwxd9HdDLhZeRQpAZNNqWvnunyFkYKe0cMCNQhs1rjiSYR4vB/AC9jKWCIgPsvsTJb+XrEKr7/JY2tDf69dwS1mRG2M6u1SQ9UFfaumwG/6xvZNgRp7fOs8IIVQKqUQzv9kdfxiffxDsh1lg8S5H0NwC9c1WcGFI+ABihR8xPF/N4IeRX+4KbUayWMekK3PJZnLbRCXNYEYYDkd4BY4AAv8ckYl7q/eb0LJb4jxcavpbyM7pmxd3lTZvqgO3pw/n/o5yxtGO2Lb5Wn3DXHkcdOTDm9Cm1mOXBEJ+QPIFmzCS7iSYYHTkQSEOgwylHE1fY0eGLZHNCb1i4giiwtfcu3VzZxEGBxsuatMTJm+gxkGJK4111h3VM8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dc0b3b-d8e3-4e39-7a33-08dc9151f914
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:54:03.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9pvgxq0kLXGn/nonuU0p2SMT6NXFDktErDmzFw6jZ59zFrCgIlSR160ZZZAS62cV96LvtXn0LrmZe9lO2NfEzYhnzOU79a7GpHnZODXUHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=728 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406200129
X-Proofpoint-GUID: JaL8MZ2Fw1G6oI9M08l7abpiqUfPeLaa
X-Proofpoint-ORIG-GUID: JaL8MZ2Fw1G6oI9M08l7abpiqUfPeLaa

On Wed, Jun 19, 2024 at 02:15:21PM +0100, Nick Alcock wrote:
> On 19 Jun 2024, Kris Van Hees stated:
> 
> >> -/* #include <linux/buffer_head.h> */
> >> +#include <linux/blk_types.h>
> >
> > This causing a dlib generation failure because this include is not sufficient:
> >
> > In file included from /home/kvanhees/linux-uek/arch/x86/include/asm/pgtable_types.h:380,
> >                  from /home/kvanhees/linux-uek/arch/x86/include/asm/processor.h:21,
> >                  from /home/kvanhees/linux-uek/arch/x86/include/asm/cpufeature.h:5,
> >                  from /home/kvanhees/linux-uek/arch/x86/include/asm/thread_info.h:59,
> >                  from /home/kvanhees/linux-uek/include/linux/thread_info.h:60,
> >                  from /home/kvanhees/linux-uek/include/linux/spinlock.h:60,
> >                  from /home/kvanhees/linux-uek/include/linux/wait.h:9,
> >                  from /home/kvanhees/linux-uek/include/linux/wait_bit.h:8,
> >                  from /home/kvanhees/linux-uek/include/linux/fs.h:6,
> >                  from /home/kvanhees/linux-uek/include/linux/highmem.h:5,
> >                  from /home/kvanhees/linux-uek/include/linux/bvec.h:10,
> >                  from /home/kvanhees/linux-uek/include/linux/blk_types.h:10,
> >                  from libdtrace/io.m4:14:
> > /home/kvanhees/linux-uek/include/asm-generic/pgtable-nopud.h:18: warning: "PUD_SHIFT" redefined
> >    18 | #define PUD_SHIFT       P4D_SHIFT
> 
> Not observed on 5.4.17, nor on 5.15.0. What kernel is this with?

Upstream 6.9.3 and 6.9.5

> > The cause seems to be that you should add an include of linux/kconfig.h prior
> > to including linux/blk_types.h.  And in all, including linux/buffer_head.h seems
> > to be safer because blk_types.h says it shouldn't be included explicitly except
> > to break include loops.
> 
> Oops, I didn't look at the header comment because it's usually just a
> copyright message :)
> 
> It works, but at first sight it's not obvious how linux/buffer_head.h
> defines BD_PARTNO: I guess it's doing it transitively via some tangle of
> other headers. I guess it's always going to include blk_types.h
> *somehow*, so I suppose it's safe.
> 
> -- 
> NULL && (void)
