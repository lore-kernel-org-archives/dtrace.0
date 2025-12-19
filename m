Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED42417D1
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123867; cv=fail; b=aUEp0cOq3b9DJ1VW2UQlM0Zyfz5rzkDbS/wLmrqTNZFfHaV7N65woGa8jUQH85cYbnJmq73v6YKLwrD+b3OxoIWenccM8VDsVLFefvc3zx8x2xVkJBPh4MmBUSiWWMaszdyJCzq1M0zcV+TXNR3RoHyKd2NjfMVgxNCg7worT68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123867; c=relaxed/simple;
	bh=NN8uFJjw1oOf8FJRUapXNOEsPvC4bkF8UwXeD3LCCuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eCV+HSL+GmrnA34Tu4UnLxUAqfbHoChD1mTvyc3WczP5GE0K3bCUxx9idSj61kqcFbvfNunmtbuwz87+Yj5QHDnm0ZM16KDpG8AmrDfo1JYXiXtbLJnA+ERV45ZxEjXEj7IQNCubO9U2voi/uyxMzkMP7Raw76r5LTPbBnT69pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J77tF/GV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CIhca97N; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J77tF/GV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CIhca97N"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3EEIr2931746
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nzgtjzMsuDQhzCT/Lk
	eyd4df+OEUCAWzCzV6gbtFXJ0=; b=J77tF/GVRliEHLdqDK6kRMr8exonkBUKPx
	Bahi6Rs+9zUtS8scFy2SPr1oXEDWwBoeEYiL/qZyLKzVlJC5pYhIZ0r7OQ7pFcnd
	gDpAceORQB58Sg5Bb8ZJjLrvMb4IaN7vXY1lQcab1cehvB8EHfXX4kL2Ar8hsPsC
	nOspABbb3XUd5t/mCibYSmrstTxXaMIwIY72EokL03+UBLAMaADrnFFPHNAqzFum
	deDk3mn6VW7DLGIpAMShImjsIfrlvRDHO0myW8iQMVKkAEXgJgu9CYMJBKXgB9z4
	dw9Be0Pdi6jPZKlzJy7bCJGx3un+rQ95n5DBQCsDLHVb8WbWJSTg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r288h5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:57:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ4pWWf036088
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:57:43 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtcyr55-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggpYvNEJUlgbsZWOWEU5/dRoocqTDneNMT6G+f9mKTDT/5ND/qNw0AE5ZyowdIE+e+HeqzQBzgob4/pSSj5Mj4WqzXtGPVQy1tg+SdVCTcQMghxiiJqtYviRvjAphPUTZfFhi/ySewL13dHcf/kGXAKdL5dWGw4zv9t9kc+cglYVpGLcKxoQ33v4v2tkqZYoNG7Qj7rrepxTaom2WzDfiV+5W0lYeThjDVNrd9mdLrCOks8XVbBewK727UQY8ocAYG4eILz3e1fQcJLWPlBOQN7lLG+4AUMVBmn+PoFxvlIi4/Qx+vFtPnpSpeeQtz4FywQyinssMUwy/6myExqibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzgtjzMsuDQhzCT/Lkeyd4df+OEUCAWzCzV6gbtFXJ0=;
 b=LnygljJ2qmvyMflWUNDNHvQPYwubU4JjoIxkhUfSQOAxKy59f9pNLcQquRjdk/c/QHDY12xSVdUnhGFdjnt2os9nL6a2kz/xPLeKO/fT92ThDMf4OIajWjwDSHCGubeP08fLZVJ8GpikXwnLetrHR5y8+1D6eKbtmcItV0pKAxc+BM0o2Y0t6nBmAXYhdUYR+plDRRZQP10+LePJYX9gCk8ympfUYz+7dSyTEvRG/c5k28kqiVs8fisiK6uveXSloQ/zW1U9te2wC3lgL5k/+6Uv4RgIRr8oinj4PsmJikQtBesyHTjDIkP6UgDWMdYJNOkZdShDYs172O0JNbdrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzgtjzMsuDQhzCT/Lkeyd4df+OEUCAWzCzV6gbtFXJ0=;
 b=CIhca97N07N6Tdg31aPlufNERp7HGYg+t6ZmUHLa8I90NCsCcV7KjZztrUBo5wzFz5pK5oF6+t/Um46+n/ZHFbm7IcHOQwAkCWNlFGVCUJr3mliPrieT3BI/gT4wKLShtdhOihJFWXJdxlzi1+cXwCZGLnQvGIZRHVcpcMBDGKg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6966.namprd10.prod.outlook.com (2603:10b6:510:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 05:57:41 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:57:41 +0000
Date: Fri, 19 Dec 2025 00:57:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/3] doc: Clean up list of unimplemented functions
Message-ID: <aUTpUwCfK4Ow5p5S@oracle.com>
References: <20251211190003.10486-1-eugene.loh@oracle.com>
 <20251211190003.10486-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211190003.10486-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c39b66-baa0-4578-d560-08de3ec3859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W3bVcW9fnNvhzGjGjJvlBcm5CCT/1u26dMdAtarpbfcYvbUw3hEZ9wdEfu+G?=
 =?us-ascii?Q?T8PFbgmPsKk3bL+6aM5DnDyQvxO0ov74Gmd2d+AjMfi9Vi2lK4qtEOsaxCfx?=
 =?us-ascii?Q?ivhBP9fsVN5Qj4rclPMDeet7d/QawnoCWXZ8EsIzCvWS+0QwXdl2tlkIazho?=
 =?us-ascii?Q?wZwO/ydYRYZhadYX9uqrm4Lr+f+SZUIZMGjZ1uX0LmJEDRbtFNqloX55LIAB?=
 =?us-ascii?Q?E1WPfeAkq66ZisQv3j2hlPmdlbsUTCCiipqTQ7w9N0oNrARKl/mjlACn/UWx?=
 =?us-ascii?Q?HTXyRcGvSwJ4lrrm1LA9SdUBpFedsP+XTyeclRadA9f5bry5jS0u6vbMcSUP?=
 =?us-ascii?Q?6p61yjUPHkxF7n+bnT+IJowC9ywa+tEDwxfbH9tRZz+P3Xzv0ocCJZAW+eMM?=
 =?us-ascii?Q?IxaBK5Ifiwylaog3cZWjKDwossF1eAh3oatlbHQiwbq+lYtlJfYWJGrv92JL?=
 =?us-ascii?Q?i7IaCDNSKweuxc9cAnLXfA7XM41M/fPqOg8jp39hIwAx4htJwczllYjMWYq5?=
 =?us-ascii?Q?oJIKxcMad8Iq5Z+lFx6cgCEl9vwYUxDZN0X65wi5YMKY4XumrJFhexeBqpW2?=
 =?us-ascii?Q?hQMupO/IMBMXmt3LffAJn+BIcIPaD9F4RIg7P5HKMqXy2qJXWYuukJ5h6NQS?=
 =?us-ascii?Q?RtAH95c9XqHhDX+lzodBGN7LwqO1tZLchnWSZ4vYcw0p6NTBr9BAFpL6Cy2j?=
 =?us-ascii?Q?hMTbd9XhYm3LwuB728g+IBfYemxrMCyw9eZ4Byp+DShc28FE6feCMo0vPiA0?=
 =?us-ascii?Q?I8X/RJ/zIApCVR1bGWdW9JeGkzsk5/WmU6ynmKGL3WzrpGBknOoeHkGDtes5?=
 =?us-ascii?Q?zRbdrpWj8fMrPz6l+xNiy8RhZUIYHZTdqZHFn7Ce851HE8DwKii6RJOyhV38?=
 =?us-ascii?Q?xJiDC9Xgx5cyh/xerGYc0xMUQdsHrz3KAnzdPaxtXcBue/8xKXKde4f+3hIo?=
 =?us-ascii?Q?hLeH05BkMuWKhYChZgQL5qKqLlyIfPFEoo47a7muFIjHXTIlOB19cV2Q2ejr?=
 =?us-ascii?Q?9fSZhSql8OjGUBWhvdvrQ/8+AAEO7/xfUeR4WZ0gb04wC5cdVr+yQtNGs2Pz?=
 =?us-ascii?Q?fqK5PpYYJWyoNVOP7WUWFzV79p/VTSIibZY6YgPGSOzjOrWskf8KvUSKVwfk?=
 =?us-ascii?Q?EyMVC/EnOEZT9z/NV17+qlJpr78BdNhm+xqRKcjj+6fEZ3UUsbrrYUH9blLw?=
 =?us-ascii?Q?Jd5fop58jC8KeH4E8+a4rNmIlFrgRwku5ilkJM3qMOj/7zkMQx4a3P2EE9gZ?=
 =?us-ascii?Q?Vd9VFCX4zfRE2bV9p/OpLq15I+ZOScV8CGLKqsbLnSkkKDLDhe7/13achuQm?=
 =?us-ascii?Q?g1dEDOfXrwOPYJT324c9x3HjUTLlhfj3ShcBtpDcaUQQUX2LfKwsFUhsJy0s?=
 =?us-ascii?Q?+VFsK6KXdFBsunABgjM3j1hPOT1s1f9JbGatF8+Ck7mUYVYi6WeGMh2iCpeK?=
 =?us-ascii?Q?TxhWR822ezG5zGpYSEpjNQsYTwAwDIMd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YlSI40wnGZQvEMbvllG2D4BlO5qfEKTGzbWJ5Kc5q4gzMupKdqAj52tMwlZQ?=
 =?us-ascii?Q?6ynoYC8t4Ly9WKkNpb3lflLKjeDuildGrsKb4jYalzj1SVA5PqD5i2uicPKp?=
 =?us-ascii?Q?4Z1rcp3UWi4atwpPWPGdpXxbwrDfB9OhM6cdXeg880gPkMl4hRJhqimdLY5d?=
 =?us-ascii?Q?AoYm2wz03xpcs9gHjnBD3knGx2/ypErGbGBzpvpYCq9dIh07YOmheBLndV4b?=
 =?us-ascii?Q?v6otkDp5/z8qI32TmXy/ynQAMmnvpIIAxIien498Uau5H3XOmIqOrIdt9mTS?=
 =?us-ascii?Q?jziy8iQ7TkQN08CneCGgY7+eW38c+C2uxPBF2eySU2FSIjlkQKX3vsgdwwA1?=
 =?us-ascii?Q?54h5FM1uZtF5dy0PT4anxO9hacN0jzyIgokcqO+ic44KtIZ53AHTJuueR7Ti?=
 =?us-ascii?Q?PcPTMYo0TPXc6ua/qjDAgPK8O2A4wpsmlbrvcdgtuGDefeChUamUhRz1kv+u?=
 =?us-ascii?Q?mvlj5vY4fE2xMFlnWIBAFPE5L4CKj7HP7Q8BrIRNbg+GRUQuRyyoe5XYuTub?=
 =?us-ascii?Q?TzOc8+iYWUDEKl6/p8ojow/DIrRcCUgFaVFe+W25O4lwNnw9xNpG1j768dnK?=
 =?us-ascii?Q?CqubatyK9klyqk+fSmp+n53kTNgjSY+FLCS7J0eNfocBEjPGolk+82TnF7G5?=
 =?us-ascii?Q?3WIOTA8/wgAHTbhiILFJPjErQigBQE7udGBJM4ZBimQgdrAINeX2IY3Xay4m?=
 =?us-ascii?Q?eOUY4pa45ND/eFVjY+ssXR5XCbh9MIdV/bPnyMGoELXuoX97oXLG+NHyo+kY?=
 =?us-ascii?Q?AQtys47+wvhEmKpzjB0xEoT2qvoBKRI63/OPmQsCY3ztrAsQVzGZloU9GmDX?=
 =?us-ascii?Q?aeFtl1vnMKej4BgBs+1+Py8flEdsBfYU4jiB4qHbDk9R6Hc00dBG4SPMp1dm?=
 =?us-ascii?Q?j/lsu5yka8vZix8GfgMOtqqLAU2jjxPATy3t9V4Z0kwtvl78CV2Xncte3ZeF?=
 =?us-ascii?Q?FNcm5gKC0Aj9X5H9CQVwiL6j2CJinbwCXrOssrHgh01hCSaY37WDfpQ+JVgB?=
 =?us-ascii?Q?+lz3DSjtGBWkmdO+uHUObsVsYjkyAxbsgkobGl681sL7yGdUqwRcl5lgdFW6?=
 =?us-ascii?Q?fKtr6V+uPRy39v8TkfEzXz6cagHMrQ86XEOP/XBVQqhmDfVKcNXpG1waoZov?=
 =?us-ascii?Q?gj10Vg4BLmfh/c1zvxYv9Dbn9+MS3EgjLZPqn0Wr2I7pG+Rd67ecPpNKlMCH?=
 =?us-ascii?Q?izt9IyNh9i9OCJuVsdF1JjzXY4/9LmGIbtEUbIT/vFHaGa5/ryGD6sI2XZpt?=
 =?us-ascii?Q?iOnhzq2F47xzQTtJgCT75WQetBoI6211njjzoBGtulxtx8A3qHBgwbc59Oxj?=
 =?us-ascii?Q?tpWsXIbnuBaduoeEuxBR6o7eVv6k3/1fHXvDe7oumSa7FkUZ2UgeL2ioIgGH?=
 =?us-ascii?Q?HvOx54WAYzrKbAGh6wyqHabVlJu+FmA3ldEtEpypDiEbTAC3MPmymlNQm32x?=
 =?us-ascii?Q?AS6pyujhSOBr5qOKxitf8gGQtQ882ueY9/4+7tr+I7VoFHU3JGQ+MzmF7iKq?=
 =?us-ascii?Q?LBJG/jzij5izBIfcnNBJ2EXwpqukUuuHNfgdfguEWfD1jQX2D9IdCKfPe5f3?=
 =?us-ascii?Q?VpJFOA2Ow+zw90isDYYWnuqWG6u1Vmb7Sjq0sfnMT7qMajkhr3vFDCe5WOnz?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VAIfQbHd/ePNvbq36GLUtshLCAKmxWf4AUvDuy95qN4Wu8GxyvkLsJo6k70R2jAlShttVZ7BsQT9EAqpmoFlhi0wKBGj2s4e8knAsgOhkHXR5rrNFlci7aAVikFi92viF8Bo7PJqIiWmM0JtJmqOLAFXeXxgBYPLN4lbPmAhxDX9KpmFiO9T/A6rtT9RhyWrLjNM25QnmF8ezrkLZHUJ4wKBwNXaT225VSsGWmRTsSv7r9a0Pt+XdVC5JpXvIA+Tp24lsKcp9l/qNFpwunjdpI07KksKRDV+ewdNCEOImC/BDZk+NDE38c8ufadZYjjEjaGsjyULgCkGUSZGKzZ3ee4PzeaqrBTfmVLIiroXMW8Xp3dMJe8YViDxZsDdViqSiJASdyXxrQLvIlCCVFDsAgrnKTBWrvXv0uvND0BHeiVFefalU9Qs04knSeZl7jS5MndEQyTKRP5DtLq/90FaexMfT4cxDq5oTaGjostVN213wWuov4t4IZxR3uDjnxe9FgQGk3HUj7u3Wo/lOO2y8QccCqJ5Hxxq4E0kxT68wQQzNYka5oNDMIup/gWGxSGho2inKaOZD+q6tiOQPLvuGkrK2HfDUn+ZnMyfopL55vE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c39b66-baa0-4578-d560-08de3ec3859a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:57:41.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olq67DbFWEo0FIKJ1ZqQ6lI2B3Vo38Ax131dlo8i6z50R5pFw+XN5Q6ppHHnWA8IyHdG0bEk+Ha7PnaKT+FXzzcnleSlUht69Le5A/ZBJX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512190047
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0NyBTYWx0ZWRfXxfkG4N0JS2Hb
 z1oDfuocYDWSvqgiw7ksmySsxfdTEAel9aKThzNSzWuH02YJH51AlIj7l1WXRXJoUgppjbBOo4h
 RQgCowCAYR6HshLP+QbkPh4gPvx/76m8qdZeRznQmXehquLgz+JyJawMI3JupCOlkLSOUUbllI8
 5+uGhX3Z5A9jU1CsXNK1BDh3tvR2++9I7lgl06YEt4wo8e4OOiRI8+gqr2R3tIEsNmCk2sYbOvN
 SyxiIeTv2sb1cAZXhvwOgWFuALm3LngrP1F4y1Rfvj159GhrT8bC/pR4SxD5ZzYNDJkkpjh5KNa
 TeMAlaHAGkeXz8ZNjuZnK/TWLJ7xq1vsg2XknHJnf/o+rw59qeGknyRxSE9uFK8dCyyau18vxuA
 8HSU52nsqD7aZGOvGbtN3Gpmvm0LmI5aTGaT0D0tQFbUiE5Gz9blZcGxksAxoYvuhTX6CGMR7zu
 vX2z9qED9Z986ztJnjg==
X-Proofpoint-GUID: Pz111d_eYx2EeJ-x7mqxvZoQ4_BT4gpV
X-Authority-Analysis: v=2.4 cv=H/nWAuYi c=1 sm=1 tr=0 ts=6944e958 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=_Q5nkBWkhwj03xHq5rgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Pz111d_eYx2EeJ-x7mqxvZoQ4_BT4gpV

Comments below...

On Thu, Dec 11, 2025 at 02:00:03PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/unimplemented_functions.md | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
> index f69600b56..a63bffdde 100644
> --- a/doc/userguide/reference/unimplemented_functions.md
> +++ b/doc/userguide/reference/unimplemented_functions.md
> @@ -6,25 +6,13 @@ and some functions are not relevant to Linux and might never be implemented.
>  The following functions are not currently implemented:
>  
>  -   `breakpoint`
> -
>  -   `chill`
> -
>  -   `dpath`

This is actually called d_path() and was always meant to be used internally.
It *is* implemented although only as a stub that always returns "<unknown>".
So, I am not sure whether we want it listed here as unimplemented, but I also
would not document it elsewhere.

So, perhaps just remove it here also and remain silent on it?

>  -   `ddi_pathname`
> -
> --   `inet_ntoa6`
> -
> --   `inet_ntop`
> -
>  -   `msgdsize`
> -
>  -   `msgsize`
> -
>  -   `panic`
> -
>  -   `pcap`
> -
>  -   `stop`
>  
> -
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> -- 
> 2.47.3
> 
